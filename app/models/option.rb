class Option < ActiveRecord::Base
  belongs_to :space, class_name: 'Space', foreign_key: :space_id

  # validates :option_id, numericality: { only_integer: true }
  # validates :name, presence: true
  # validates :count, numericality: { only_integer: true }
  # validates :charge, numericality: { only_integer: true }
  # validates :space_id, numericality: {only_integer: true }
end
