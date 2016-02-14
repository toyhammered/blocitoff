class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticated?

  def show
    user = User.find(params[:id])

    if permissions?(user)
      render json: user, each_serializer: Api::V1::UserSerializer
    else
      render json: { errors: "You do not have permission to view that user" }, status: 400
    end
  end


end
