class ShowsController < ApplicationController
  def create
    @user = User.find(params[:show][:user_id])
    @show_name = params[:show][:title]
    Show.find_show(@show_name, @user)

    redirect_to edit_user_path(@user)
  end
end
