class ChickensController < ApplicationController
  # Create metod fo filtering top chickens for home page
  # def top
  #   @chickens = Chicken.where(rating: 5)
  # end

  def index
    if params[:chicken].present?
      sql_query = <<~SQL
        breed @@ :query
        OR gender @@ :query
        OR name @@ :query
        OR address @@ :query
      SQL
      @chickens = Chicken.where(sql_query, query: "%#{params[:chicken][:query]}%")
    else
      @chickens = Chicken.all
    end
    @markers = @chickens.geocoded.map do |chicken|
      {
        lat: chicken.latitude,
        lng: chicken.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {chicken: chicken}),
        # marker_html: render_to_string(partial: "marker", locals: {chicken: chicken})
        image: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @chicken = Chicken.find(params[:id])
    @booking = Booking.new
  end

  def new
    @chicken = Chicken.new
  end

  def create
    @chicken = Chicken.new(chicken_params)
    @chicken.user_id = current_user.id
    if @chicken.save!
      redirect_to chicken_path(@chicken), notice: "Chicken was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chicken_params
    params.require(:chicken).permit(:age, :breed, :egg_capacity, :gender, :noise_level, :price, :photo)
  end
end
