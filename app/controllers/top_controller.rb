class TopController < ApplicationController

  def show
    @foods = Food.population_foods
  end

end
