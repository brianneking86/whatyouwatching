class User < ActiveRecord::Base

  has_many :user_shows
  has_many :shows, through: :user_shows
  has_many :friends

  def self.create_from_omniauth(auth_hash)
    user = self.create(u_id: auth_hash[:uid],
                name: auth_hash[:info][:name],
                picture: auth_hash[:info][:image])    
    user.add_friends
    user.add_shows
    user
  end

  def add_friends
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
    while likes != nil
      likes.each do |hsh|
        if hsh["category"] == "Tv show"
          tv_shows << hsh["name"]
        end
      end
      likes = likes.next_page
    end
    tv_shows.uniq!

    tv_shows.each do |tv_show|
      i = Imdb::Search.new(tv_show)
      m = i.movies.first
      show = Imdb::Serie.new(m.id)
      s_title = show.title
      s = Show.find_by(:title => s_title)
      if s == nil
        s = Show.create_show(show)
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

  def friend_shows
    show_count_hsh = {}
    self.friends_list.each do |friend|
      friend.shows.each do |show|
        if !self.shows.include?(show)
          if show_count_hsh[show]
            show_count_hsh[show] += 1
          else
            show_count_hsh[show] = 1
          end
        end
      end
    end
    show_count_hsh
  end

  def shows_sort_by_friends
    self.friend_shows.sort_by{|key, value| -value}.to_h
  end

  def shows_sort_by_rating
    show_rated = {}
    self.friend_shows.each do |show, value|
      show_rated[show] = show.rating.to_f
    end
    show_rated.sort_by{|key, value| -value}.to_h
  end

end
