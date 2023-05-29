class ChickensController < ApplicationController
  # Create metod fo filtering top chickens for home page
  # def top
  #   @chickens = Chicken.where(rating: 5)
  # end

  def index
    @chickens = Chicken.all
  end

  def show
    @chicken = Chicken.find(params[:id])
  end

  def new
    @chicken = Chicken.new
  end

  def create
    @chicken = Chicken.new(chicken_params)
    @chicken.save
    # redirect_to chicken_path(@chicken)
    if @chicken.save
      redirect_to @chicken, notice: "Chicken was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chicken_params
    params.require(:chicken).permit(:age, :breed, :egg_capacity, :gender, :noise_level)
  end
end
