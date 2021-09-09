class Room < ApplicationRecord
  has_many :receipt_details, dependent: :destroy
  has_many :furnitures, dependent: :destroy
  has_many :receipts, through: :receipt_details
  has_many_attached :images
end
