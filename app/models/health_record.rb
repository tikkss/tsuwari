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

  validates :time_period, inclusion: { in: TIME_PERIODS.map{ |time_period| time_period[:value] } }
  validates :health,      inclusion: { in: HEALTHS.map{ |health| health[:value] } }
end
