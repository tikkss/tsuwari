class Eating < ActiveRecord::Base
  AMOUNTS = [
    { value: 1, label: "全然" },
    { value: 2, label: "ちょっと" },
    { value: 3, label: "半分" },
    { value: 4, label: "全部" },
  ]

  DEFAULT_AMOUNT = 1

  attr_accessor :food_name

  belongs_to :health_record
  belongs_to :food

  # 全部食べれた料理
  scope :so_good, -> {
    where(amount: AMOUNTS.last[:value])
  }
  scope :latest, -> {
    order('eatings.created_at >= ?', 1.week.ago)
  }

  validates :food, presence: true
  validates :amount, presence: true, numericality: { only_integer: true },
    inclusion: { in: AMOUNTS.map { |amount| amount[:value] } }
end
