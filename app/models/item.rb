class Item < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true

  default_scope { order('created_at DESC')}
end
