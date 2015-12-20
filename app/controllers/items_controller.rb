class ItemsController < ApplicationController
  before_action :authenticate_user!


  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved."
    else
      flash[:error] = "Error creating Item. Please try again."
    end
    redirect_to current_user
  end

  def destroy
    @item = Item.find(params[:id])

    # prevent users from deleting other users tasks
    if current_user != @item.user
      flash[:error] = "You do not have the authority to do that task"
    elsif @item.destroy
      flash[:notice] = "Congratulations on completing the task!"
    else
      flash[:error] = "Something seems to have gone wrong. Please try again."
    end

    redirect_to current_user
  end

  def update
    @item = Item.find(params[:id])

    if current_user != @item.user
      flash[:error] = "You do not have the authority modify that task"
    elsif @item.attributes.has_key?(params[:attribute])
      @item.update_attributes(params[:attribute] => Time.now)
      flash[:notice] = "Congratulations on completing the task!" if params[:attribute] == "completed_at"
      flash[:notice] = "This task has been reinstated" if params[:attribute] == "created_at"
    else
      flash[:error] = "Something seems to have gone wrong. Please try again."
    end
    redirect_to current_user
  end


  private

  def item_params
    params.require(:item).permit(:name)
  end


end
