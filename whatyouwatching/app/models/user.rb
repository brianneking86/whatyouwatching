class User < ActiveRecord::Base

  has_many :user_shows
  has_many :shows, through: :user_shows
  has_many :friends

  def self.create_from_omniauth(auth_hash)
    u = self.create(u_id: auth_hash[:uid],
                name: auth_hash[:info][:name],
                picture: auth_hash[:info][:image])
    u.add_friends
    u.add_shows
    u
  end

  def add_friends
    # make API call to facebook to get friend list
    # iterate over friend array returned by facebook
    # create rows in friends table with friend's facebook u_id
    @graph = Koala::Facebook::API.new(ENV['ACCESS_TOKEN'])
    profile = @graph.get_object("me")
    friends = @graph.get_connections(profile["id"], "friends")
    friends.each do |friend|
      self.friends.create(:u_id => friend["id"])
    end
  end

  def add_shows
    tv_shows = []
    likes = @graph.get_connections("me", "likes")
    last_likes = @graph.get_connections("me", "likes").last
    while likes != nil
      likes.each do |hsh|
        if hsh["category"] == "Tv show"
          tv_shows << hsh["name"]
        end
      end
      likes = likes.next_page
    end
    tv_shows.each do |tv_show|
      s = Show.find_by(:title => "#{tv_show}")
      
      if s == nil
        s = Show.create_show(tv_show)
        self.user_shows.create(show_id: s.id) #add to join table
      else
        self.user_shows.create(show_id: s.id)
      end
    end
  end

  def friends_list
    friend_array = []
    self.friends.each do |friend|
      u = User.find_by(:u_id => friend.u_id)
      if u != nil
        friend_array << u
      end
    end
    friend_array
  end
end
