class Serving < ActiveRecord::Base
  belongs_to :shop
  belongs_to :food

  def food_name
    @food_name || self.food.try(:name)
  end
  def food_name=(s)
    @food_name=s
  end

  validates :shop_id, :food_id, presence: true
  validates :food_id, uniqueness: {scope: :shop_id},
                      inclusion: { in: Food.all.pluck(:id) }
end
