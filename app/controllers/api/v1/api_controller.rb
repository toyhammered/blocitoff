class Api::V1::ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private

  def permission_denied_error
    error(403, 'Permission Denied!')
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: response.to_json, status: status
  end

  def authenticated?
    authenticate_or_request_with_http_basic do |username, password|
      resource = User.find_by(username: username)
      if resource.valid_password?(password)
        sign_in :user, resource
      end
    end
  end

end
