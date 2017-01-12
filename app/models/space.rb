class Space < ActiveRecord::Base

  has_many :options
  has_many :reservations
  belongs_to :user

  default_scope { where(authorize: true).order(id: :desc) }

  # validates :name
  # validates :adress
  # validates :tel
  # validates :member_limit
  # validates :charge
  # validates :min_time_block
  # validates :max_time_block
  # validates :start_time_block
  # validates :finish_time_block
  # validates :description
  # validates :cancelation_charge
  # validates :style
  # validates :owner_id
  # validates :visible
  # validates :autherized
end
