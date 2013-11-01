class TopController < ApplicationController

  def show
    @shops = Shop.recent_shops
  end

end
