class Category < ActiveRecord::Base
  has_many :shops
  
  validates :name, presence: true
end
