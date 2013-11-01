class TopController < ApplicationController

  def show
    @shops = Shop.recent_shops
    @foods = Food.popular_foods
    @health_records = HealthRecord.recent
  end

end
