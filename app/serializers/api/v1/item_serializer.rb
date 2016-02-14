class Api::V1::ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :created_at, :updated_at, :completed_at

  def user_id
    User.find(object.user_id).username
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

  def updated_at
    object.updated_at.strftime('%B %d, %Y')
  end

  def completed_at
    object.completed_at.strftime('%B %d, %Y') unless object.completed_at.nil?
  end
end
