class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :space
  has_many :reservation_options, dependent: :destroy
  has_many :options, through: :reservation_options

  scope :recent, -> { order(created_at: :desc) }

  # validates :reservation_id, numericality: { only_integer: true }, uniqueness: true
  # validates :member_id, numericality: { only_integer: true }, uniqueness: true
  validates :start_time_block, presence: true
  validates :end_time_block, presence: true
  # validates :space_id, numericality: { only_integer: true }
  validate :valid_date
  validate :available
  validate :valid_time_block

  def self.time_block_text(number)
    "#{number / 2}:#{number % 2 == 0 ? '00' : '30'}"
  end

  def total_charge
    time = self.end_time_block - self.start_time_block + 1
    total = self.space.charge * time
    self.options.each do |option|
      total += option.charge * time
    end
    total
  end

  private

  def valid_date
    if date.present? && date < Date.today
      errors.add(:date, "過去の日付は使用できません")
      return false
    end
  end

  def available
    available_list = self.space.available_list_at(self.date.to_time)
    (self.start_time_block..self.end_time_block).each do |i|
      unless available_list[i]
        errors.add(:start_time_block, "その日はすでに予約されています")
        return false
      end
    end
  end

  def valid_time_block
    if self.start_time_block > self.end_time_block
      errors.add(:end_time_block, "時間枠が不整合です")
      return false
    end
  end
end
