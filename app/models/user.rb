class User < ActiveRecord::Base
  has_secure_password

  enum member_type: { client: 0, owner: 1}

  has_many :reservations
  has_many :spaces

  validates :mail, uniqueness: true, presence: true
  validates :name, presence: true
  validates :name, length: { maximum: 20 }
  validates :password, presence: { on: :create },
            confirmation: { allow_blank: true }

  attr_accessor :password

  private


end
