class AddDefaultValueToBooking < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :booking_status, :string, default: "pending"
  end
end
