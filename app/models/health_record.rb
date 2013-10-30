class HealthRecord < ActiveRecord::Base
  TIME_PERIODS = [
    {value: 1, label: '朝'},
    {value: 2, label: '昼'},
    {value: 3, label: '晩'}
  ]
  HEALTHS = [
    {value: 1, label: '悪い'},
    {value: 2, label: '普通'},
    {value: 3, label: '良い'}
  ]

  has_many :eatings, dependent: :destroy
  has_many :foods, through: :eatings

  accepts_nested_attributes_for :eatings,
    reject_if: ->(a) { a[:amount].blank? }, allow_destroy: true

  def get_time_period
    ret = {}
    TIME_PERIODS.each do |t|
      ret = t if t[:value] == time_period
    end
    return ret
  end

  def get_health
    ret = {}
    HEALTHS.each do |h|
      ret = h if h[:value] == health
    end
    return ret
  end

  # Eatingのvalidateに引っかかったかどうか
  # valid? = false が一件でもあればtrueを返す
  #
  # @return [TrueClass, FalseClass]
  def eatings_invalid?
    eatings.map { |r| r.valid? }.include?(false)
  end

  # Eatingのvalidateに引っかかったfood_nameを連結して取得
  # 引っかかったものが無ければnilを返す
  #
  # @return [String, NilClass]
  def not_found_food
    result = []
    eatings.each { |r| result << r.food_name unless r.valid? }

    result.count > 0 ? result.join(", ") : nil
  end

  validates :time_period, presence: true,
    inclusion: { in: TIME_PERIODS.map{ |time_period| time_period[:value] } }
  validates :health, presence: true,
    inclusion: { in: HEALTHS.map{ |health| health[:value] } }
  validates :date, presence: true, uniqueness: { scope: :time_period }
  validates :eatings, associated: true
end
