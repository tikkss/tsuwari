class Food < ActiveRecord::Base
  has_many :food_tastes
  has_many :tastes, through: :food_tastes

  accepts_nested_attributes_for :food_tastes
end
