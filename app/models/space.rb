class Space < ActiveRecord::Base

  has_many :options
  has_many :reservations
  belongs_to :user

  default_scope { where(authorize: true).order(id: :desc) }

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

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
