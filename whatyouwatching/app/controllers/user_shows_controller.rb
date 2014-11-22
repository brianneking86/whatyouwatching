class UserShowsController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @show_id = params[:user_show][:show_id]
    us = UserShow.create(:user_id => @user.id, :show_id => @show_id)
    redirect_to @user
  end

end
