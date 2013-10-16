class Food < ActiveRecord::Base
  has_many :food_tastes, dependent: :destroy
  has_many :tastes, through: :food_tastes

  validates :name, presence: true, length: { maximum: 255 }

  # 検索フォームの条件にあった情報を取得
  #
  # @param [Hash] food_params 検索フォームから
  # @return [ActiveRecord::Relation] Food検索結果
  def self.search_foods(food_params)
    arel = includes(:tastes).order(:name)
    unless food_params[:name].blank?
      arel = arel.where(
        "foods.name like :name", name: "%#{food_params[:name]}%"
      )
    end

    food_params[:taste_ids].delete_if { |v| v.blank? }
    unless food_params[:taste_ids].blank?
      arel = arel.where(tastes: { id: food_params[:taste_ids] })
    end

    arel
  end
end
