class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.new
  end
  
  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to @user
    else
      flash[:error] = "Error creating Item. Please try again."
    end
  end


  private

    def item_params
      params.require(:item).permit(:name)
    end
end
