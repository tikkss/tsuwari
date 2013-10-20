class Eating < ActiveRecord::Base
  AMOUNTS = [
    { value: 1, lable: "全然" },
    { value: 2, lable: "ちょっと" },
    { value: 3, lable: "半分" },
    { value: 4, lable: "全部" },
  ]

  belongs_to :health_record
  belongs_to :food

  validates :amount, presence: true, numericality: { only_integer: true },
    inclusion: { in: AMOUNTS.map { |amount| amount[:value] } }
  validates :health_record_id, presence: true, uniqueness: { scope: :food_id }
end
