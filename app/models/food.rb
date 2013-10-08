class Food < ActiveRecord::Base
  has_many :food_tastes, dependent: :destroy
  has_many :tastes, through: :food_tastes
end
