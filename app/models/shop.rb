class Shop < ActiveRecord::Base
  belongs_to :category
  has_many :servings, dependent: :destroy
  accepts_nested_attributes_for :servings, allow_destroy: true
  has_many :foods, through: :servings
  
  validates :category_id, numericality: {only_integer: true}, allow_nil: true
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  scope :top_page_shops, -> { order("updated_at DESC").limit(3) }
end
