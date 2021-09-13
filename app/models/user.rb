class User < ApplicationRecord
  has_many :receipts, dependent: :destroy
  has_many :working_shift_staffs, dependent: :destroy
  has_many :receipt_details, through: :receipts
  has_many :working_shifts, through: :working_shift_staffs
  has_one_attached :avatar

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  VALID_PHONE_REGEX = /\d[0-9]\)*\z/.freeze
  validates :first_name, presence: true,
    length: {maximum: Settings.validation.max_length_50}
  validates :last_name, presence: true,
    length: {maximum: Settings.validation.max_length_50}
  validates :phone, presence: true,
    format: {with: VALID_PHONE_REGEX}
  validates :email, presence: true,
    length: {maximum: Settings.validation.max_length_255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: true
  validates :password, presence: true, length:
    {minimum: Settings.validation.min_length_8}, allow_nil: true
  has_secure_password
  before_save{email.downcase!}

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create(string, cost: cost)
    end
  end
end
