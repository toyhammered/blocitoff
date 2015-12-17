class Item < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true


  scope :current, -> { where(completed_at: nil, created_at: 7.days.ago...Time.now ).created_at }
  scope :completed, -> { where.not(completed_at: nil).completed_at }
  scope :expired, -> { where(completed_at: nil).where.not(created_at: 7.days.ago...Time.now ).created_at }


  def self.completed_at
    order('completed_at DESC')
  end

  def self.created_at
    order('created_at DESC')
  end

end
