class Item < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true

  default_scope { order('created_at DESC')}

  scope :current, -> { where(completed_at: nil, created_at: 7.days.ago...Time.now )  }
  scope :completed, -> { where.not(completed_at: nil) }
  scope :expired, -> { where(completed_at: nil).where.not(created_at: 7.days.ago...Time.now ) }


end
