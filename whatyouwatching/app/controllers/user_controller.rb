class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(session[:user_id])
  end
end
