class Api::V1::ItemsController < Api::V1::ApiController
  before_action :authenticated?

  def index
    items = Item.where(user_id: current_user)

    render json: items, each_serializer: Api::V1::ItemSerializer
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

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
