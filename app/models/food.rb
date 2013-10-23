class Food < ActiveRecord::Base
  has_many :food_tastes, dependent: :destroy
  has_many :tastes, through: :food_tastes

  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  # 検索フォームの条件にあった情報を取得
  #
  # @param [Hash] params 検索フォームから
  # @return [ActiveRecord::Relation] Food検索結果
  def self.search(params)
    name      = params[:name]
    taste_ids = params[:taste_ids].try(:reject, &:blank?)

    includes(:tastes).order("foods.name").merge(
      name.blank? ? all :
        where("foods.name like :name", name: "%#{params[:name]}%")
    ).merge(
      taste_ids.blank? ? all : where(tastes: { id: taste_ids })
    )
  end
end
