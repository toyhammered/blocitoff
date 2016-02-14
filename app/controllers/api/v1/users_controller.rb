class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticated?

  def show
    user = User.find(params[:id])
    render json: user, each_serializer: Api::V1::UserSerializer
  end


end
