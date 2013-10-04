class FoodTaste < ActiveRecord::Base
  belongs_to :food
  belongs_to :taste
end
