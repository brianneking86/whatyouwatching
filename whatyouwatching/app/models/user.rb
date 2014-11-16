class User < ActiveRecord::Base

  def self.create_from_omniauth(auth_hash)
    self.create(u_id: auth_hash[:uid],
                name: auth_hash[:info][:name],
                picture: auth_hash[:info][:image])
  end

end
