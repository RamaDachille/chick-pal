class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @chickens = Chicken.all
  end

  def show
    @bookings = Booking.where(chicken_id: current_user.chickens.pluck(:id)).where("booking_status ILIKE 'pending'")
    @approved_bookings = Booking.where(chicken_id: current_user.chickens.pluck(:id)).where(booking_status: "approved")

  end
end
