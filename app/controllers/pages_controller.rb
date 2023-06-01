class PagesController < ApplicationController
  def home
    @chickens = Chicken.all
  end

  def show
    @bookings = Booking.where(chicken_id: current_user.chickens.pluck(:id))
  end
end
