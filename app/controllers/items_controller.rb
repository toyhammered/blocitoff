class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved."
    else
      flash[:error] = "Error creating Item. Please try again."
    end
    redirect_to :back
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Congratulations on completing the task!"
    else
      flash[:error] = "Something seems to have gone wrong. Please try again."
    end

    redirect_to :back
  end


  private

    def item_params
      params.require(:item).permit(:name)
    end

  
end
