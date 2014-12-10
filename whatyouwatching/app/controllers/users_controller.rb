class UsersController < ApplicationController
  def index
    @user = User.find(1)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(1)
    session[:user_id] = @user.id
    if @user
      session[:user_id] = @user.id
      if @user.shows.count < 5
        redirect_to edit_user_path(@user)
      end
    else
      redirect_to root_url
    end
    @user = User.find(params[:id])
    @current_user = User.find(session[:user_id])
  end

  def edit
    @current_user = User.find(session[:user_id])
    @user = User.find(params[:id])
  end
end
