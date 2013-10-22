class Food < ActiveRecord::Base
  has_many :food_tastes, dependent: :destroy
  has_many :tastes, through: :food_tastes
  has_many :servings, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }

  scope :named_like, ->(name) {
    name.blank? ? all : where("foods.name like :name", name: "%#{name}%")
  }

  scope :tastes_with, ->(taste_ids) {
    taste_ids.blank? ? all : where(tastes: { id: taste_ids })
  }

  # 検索フォームの条件にあった情報を取得
  #
  # @param [Hash] params 検索フォームから
  # @return [ActiveRecord::Relation] Food検索結果
  def self.search(params)
    name      = params[:name]
    taste_ids = params[:taste_ids].try(:reject, &:blank?)

    includes(:tastes).order("foods.name").merge(named_like(name)).
      merge(tastes_with(taste_ids))
  end
end
