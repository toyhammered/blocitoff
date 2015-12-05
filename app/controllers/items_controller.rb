class ItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "Item was saved."
    else
      flash[:error] = "Error creating Item. Please try again."
    end
    redirect_to :back
  end


  private

    def item_params
      params.require(:item).permit(:name)
    end
end
