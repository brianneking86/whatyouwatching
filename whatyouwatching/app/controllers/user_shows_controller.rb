class UserShowsController < ApplicationController

  def create
    @current_user = User.find(session[:user_id])
    @show_id = params[:user_show][:show_id]
    us = UserShow.create(:user_id => @current_user.id, :show_id => @show_id)
    redirect_to @current_user, notice: "#{Show.find(@show_id).title} has been added to your library!"

  end

end
