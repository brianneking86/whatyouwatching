class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @current_user = User.find(session[:user_id])
  end

  def edit
    @current_user = User.find(session[:user_id])
    @user = User.find(session[:user_id])
  end
end
