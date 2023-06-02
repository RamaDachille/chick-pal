require 'pry-byebug'

class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @chicken = Chicken.find(params[:chicken_id])
    @booking = Booking.new
  end

  def index
    @bookings = Booking.where(user_id: current_user.id)


  end

  def create
    @booking = Booking.new(booking_params)
    @chicken = Chicken.find(params[:chicken_id])
    @booking.chicken = @chicken
    @booking.user = current_user
    if @booking.save!
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(update_params)
    if @booking.save!
      redirect_to mybookings_path, notice: "Booking request approved."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :chicken_id)
  end

  def update_params
    params.require(:booking).permit(:booking_status)
  end
end
