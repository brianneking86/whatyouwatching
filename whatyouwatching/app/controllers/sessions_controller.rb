class SessionsController < ApplicationController

  def new
    redirect_to '/auth/facebook'
  end

  def create
    session[:token] = auth_hash[:credentials][:token]
    @user = User.find_by(:u_id => auth_hash[:uid]) || User.create_from_omniauth(auth_hash)
    if @user
      session[:user_id] = @user.id
      if @user.shows.count < 5
        redirect_to edit_user_path(@user)
      else
        redirect_to user_path(@user)
      end
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

