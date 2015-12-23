class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    if params[:filter] && params[:filter] == "completed"
      @items = @user.items.completed
    elsif params[:filter] && params[:filter] == "expired"
      @items = @user.items.expired
    else
      @items = @user.items.current
    end
  end
end
