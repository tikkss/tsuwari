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

  RECENT_DAY = 3
  RECENT_MAX_COUNT = 9

  has_many :eatings, dependent: :destroy
  has_many :foods, through: :eatings

  accepts_nested_attributes_for :eatings,
    reject_if: ->(a) { a[:amount].blank? }, allow_destroy: true

  def self.recent
    where("date >= :date", date: Time.now - RECENT_DAY.days).
      order("date desc, time_period desc").limit(RECENT_MAX_COUNT)
  end

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
    eatings.any? { |r| !r.valid? }
  end

  # Eatingのvalidateに引っかかったfood_nameを連結して取得
  # 引っかかったものが無ければnilを返す
  #
  # @return [String, NilClass]
  def not_found_food
    result = eatings.select { |r| !r.valid? }.map(&:food_name)
    result.count > 0 ? result.join(", ") : nil
  end

  # Eatingのvalidateに引っかかったものは除外
  def cut_eatings_invalid
    self.eatings = eatings.select { |r| r.valid? }
  end

  validates :time_period, presence: true,
    inclusion: { in: TIME_PERIODS.map{ |time_period| time_period[:value] } }
  validates :health, presence: true,
    inclusion: { in: HEALTHS.map{ |health| health[:value] } }
  validates :date, presence: true, uniqueness: { scope: :time_period }
  validates :eatings, associated: true
end
