class Receipt < ApplicationRecord
  belongs_to :user
  belongs_to :room

  enum status: {wait: 0, approved: 1, complete: 2,
                cancelled_by_admin: 3, cancelled_by_you: 4}
  scope :status_priority, ->{order :status}
  scope :latest, ->{order created_at: :desc}
  scope :status_approved, ->{where "receipts.status = 1"}
  scope :on_busy_from, (lambda do |from_time|
    where("from_time <= ?", from_time) if from_time.present?
  end)
  scope :on_busy_to, (lambda do |end_time|
    where("end_time >= ?", end_time) if end_time.present?
  end)
end
