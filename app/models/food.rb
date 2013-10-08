class Food < ActiveRecord::Base
  has_many :food_tastes, dependent: :destroy
  has_many :tastes, through: :food_tastes

  # この料理が指定された味を持っているかどうか
  #
  # @param [Fixnum] taste_id 味ID
  # @return [TrueClass, FalseClass] 持っているとtrue
  def have_taste?(taste_id)
    self.taste_ids.include?(taste_id)
  end
end
