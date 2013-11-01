class TopController < ApplicationController

  def show
    @shops = Shop.top_page_shops
  end

end
