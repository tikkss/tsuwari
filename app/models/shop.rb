class Shop < ActiveRecord::Base
  belongs_to :category
  
  validates :category_id, numericality: {only_integer: true}, allow_nil: true
end
