FactoryGirl.define do
  factory :health_record do
    date { Time.now }
    time_period 1
    health 1
  end
end
