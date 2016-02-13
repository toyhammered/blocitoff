class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :created_at

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
