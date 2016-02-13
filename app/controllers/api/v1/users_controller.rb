class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticated?

  def index
    return permission_denied_error unless conditions_met

    users = User.all

    render json: users, each_serializer: Api::V1::UserSerializer
  end

  private

  def conditions_met
    true # Insecure for a reason
  end

end
