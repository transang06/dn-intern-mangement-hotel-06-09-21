class ReceiptDetail < ApplicationRecord
  belongs_to :room
  belongs_to :receipt
end
