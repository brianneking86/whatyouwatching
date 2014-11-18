class SessionsController < ApplicationController

  def new
    redirect_to '/auth/facebook'
  end

  def create
    @user = User.find_by(:u_id => auth_hash[:uid]) || User.create_from_omniauth(auth_hash)
    if @user
      session[:user_id] = @user.id
      # @user.add_shows
      # @user.add_friends
      redirect_to user_path(current_user)
    else
      redirect_to root_url
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

private
  def auth_hash
    request.env['omniauth.auth']
  end
end

