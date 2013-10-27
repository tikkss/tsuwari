class Eating < ActiveRecord::Base
  AMOUNTS = [
    { value: 1, label: "全然" },
    { value: 2, label: "ちょっと" },
    { value: 3, label: "半分" },
    { value: 4, label: "全部" },
  ]

  DEFAULT_AMOUNT = 1

  belongs_to :health_record
  belongs_to :food

  validates :amount, presence: true, numericality: { only_integer: true },
    inclusion: { in: AMOUNTS.map { |amount| amount[:value] } }
  validates :health_record_id, presence: true, uniqueness: { scope: :food_id }
end
