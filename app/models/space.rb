class Space < ActiveRecord::Base

  has_many :options, inverse_of: :space, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true
  has_many :reservations, dependent: :destroy
  belongs_to :user

  scope :visible, -> { where(visible: true) }
  scope :recent, -> { order(created_at: :desc) }

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  validates :name, presence: true
  validates :address, presence: true
  # validates :tel, presence: true
  validates :member_limit, presence: true
  validates :charge, presence: true
  # validates :min_time_block
  # validates :max_time_block
  # validates :start_time_block
  # validates :finish_time_block
  validates :description, presence: true
  validates :cancellation_charge, presence: true
  validates :space_type, presence: true
  # validates :owner_id
  # validates :visible
  # validates :autherized

  def available_list_at(date)
    reservations = Reservation.where(date: date.beginning_of_day..date.end_of_day, space_id: self)
    list = 48.times.map{ true }
    reservations.each{ |r| list.fill(false, r.start_time_block..r.end_time_block) }
    list
  end


  def space_type_text
    case self.space_type
      when 0
        '会議室'
      when 1
        'スタジオ'
      when 2
        'ホール'
      elsere
        '未分類'
    end
  end
end
