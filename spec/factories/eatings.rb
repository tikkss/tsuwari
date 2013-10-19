# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :eating do
    health_record nil
    food nil
    amount 1
  end
end
