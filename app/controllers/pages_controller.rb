class PagesController < ApplicationController
  def home
    @chickens = Chicken.all
  end
end
