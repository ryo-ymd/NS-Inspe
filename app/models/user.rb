class User < ActiveRecord::Base
  # include EmailAddressChecker
  has_secure_password

  has_many :reservations
  has_many :spaces

  mount_uploader :image, UserImageUploader

  # validates :member_id, presence: true,
  #           numericality: { only_integer: true, allow_blank: false },
  #           uniqueness: true
  # validates :mail
  # validates :name, length: { maximum: 20}
  # validates :member_type, inclusion: { in: [true, false] }
  # validates :password, presence: { on: :create },
  #           confirmation: { allow_blank: true }
  #
  # attr_accessor :password, :password_confirmation
  #
  # def password=(val)
  #   if val.present?
  #     self.hashed_password = BCrypt::Password.create(val)
  #   end
  #   @password = val
  # end
  #
  # private
  # def check_mail
  #   if email.present?
  #     errors.add(:mail, :invalid) unless well_formed_as_email_address(mail)
  #   end
  # end

end
