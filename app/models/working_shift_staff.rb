class WorkingShiftStaff < ApplicationRecord
  belongs_to :user
  belongs_to :working_shifts
end
