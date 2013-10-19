class Serving < ActiveRecord::Base
  belongs_to :shop
  belongs_to :food
end
