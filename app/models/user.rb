class User < ApplicationRecord
  has_many :receipts, dependent: :destroy
  has_many :working_shift_staffs, dependent: :destroy
  has_many :receipt_details, through: :receipts
  has_many :working_shifts, through: :working_shift_staffs
  has_one_attached :avatar

  has_secure_password
end
