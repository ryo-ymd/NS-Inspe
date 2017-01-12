class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :space

  # validates :reservation_id, numericality: { only_integer: true }, uniqueness: true
  # validates :member_id, numericality: { only_integer: true }, uniqueness: true
  # validates :start_time_block, presence: true
  # validates :finish_time_block, presence: true
  # validates :space_id, numericality: { only_integer: true }
  # validates :date_cannot_be_in_the_past
  #
  # def date_cannot_be_in_the_past
  #   if date.present? && date < Date.today
  #     errors.add(:date, ": 過去の日付は使用できません")
  #   end
  # end
end
