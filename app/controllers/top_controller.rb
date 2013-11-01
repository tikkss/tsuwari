class TopController < ApplicationController

  def show
    @shops = Shop.top_page_shops
    @foods = Food.popular_foods
  end

end
