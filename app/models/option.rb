class Option < ActiveRecord::Base
  belongs_to :space
  has_many :reservation_options
  has_many :reservations, through: :reservation_options
  validates :space, presence: true

  # validates :option_id, numericality: { only_integer: true }
  # validates :name, presence: true
  # validates :count, numericality: { only_integer: true }
  # validates :charge, numericality: { only_integer: true }
  # validates :space_id, numericality: {only_integer: true }
end
