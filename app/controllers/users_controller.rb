class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    params[:filter] ||= "current"

    if params[:filter]
      if params[:filter] == "current"
        @items = @user.items.current
      elsif params[:filter] == "completed"
        @items = @user.items.completed
      else
        @items = @user.items.expired
      end
    end

  end
end
