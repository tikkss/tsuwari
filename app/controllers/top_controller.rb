class TopController < ApplicationController

  def show
    @foods = Food.popular_foods
  end

end
