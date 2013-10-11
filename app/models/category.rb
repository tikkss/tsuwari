class Category < ActiveRecord::Base
  has_many :shops, dependent: :nullify
  
  validates :name, presence: true
end
