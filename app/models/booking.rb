class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :chicken

  validates :booking_status, presence: true, inclusion: { in: %w[approved denied pending] }
  validates :start_date, :end_date, presence: true
end
