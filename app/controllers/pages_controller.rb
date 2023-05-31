class PagesController < ApplicationController
  def home
    @chickens = Chicken.all
  end

  def show
    @bookings = Booking.where(user_id: current_user.id)
    @current_user.bookings
  end
end
