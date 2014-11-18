class User < ActiveRecord::Base

  has_many :user_shows
  has_many :shows, through: :user_shows
  has_many :friends

  def self.create_from_omniauth(auth_hash)
    self.create(u_id: auth_hash[:uid],
                name: auth_hash[:info][:name],
                picture: auth_hash[:info][:image])
    #add_friends
    #add_shows
  end


  #def add_friends

  #def add_shows
  #likes.each do |hsh|
    #   if hsh["category"] == "Tv show"
    #     tv_shows << hsh["name"]
    #   end
    # end
    #@graph = Koala::Facebook::API.new(access_token)
    #likes = @graph.get_connections("me", "likes")
end
