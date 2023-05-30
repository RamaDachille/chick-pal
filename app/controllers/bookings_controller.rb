require 'pry-byebug'

class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @chicken = Chicken.find(params[:chicken_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @chicken = Chicken.find(params[:chicken_id])
    @booking.chicken = @chicken
    @booking.user = current_user
    if @booking.save!
      redirect_to booking_path(@booking)
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
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :chicken_id)
  end

  def update_params
    params.require(:booking).permit(:booking_status)
  end
end
