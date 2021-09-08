class Receipt < ApplicationRecord
  belongs_to :user
  has_many :receipt_details, dependent: :destroy
  has_many :rooms, through: :receipt_details
end
