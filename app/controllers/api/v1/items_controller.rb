class Api::V1::ItemsController < Api::V1::ApiController
  before_action :authenticated?

  def update
    item = Item.find(params[:id])
    user = item.user_id
    if permissions?(user)
      # need to update items completed_at to Time.now
      item.update_attributes(completed_at: Time.now)
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create
    item = Item.new(item_params)
    item.user = current_user

    if item.save
      render json: item, each_serializer: Api::V1::ItemSerializer
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    user = item.user_id
    if permissions?(user)
      item.destroy
      render json: {}, status: :no_content
    else
      render json: { errors: item.errors.full_messages }, status: :not_found
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
