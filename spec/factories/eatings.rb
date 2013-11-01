# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :eating do
    health_record
    food
    amount 1
  end
end
