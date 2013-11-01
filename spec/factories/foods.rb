# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :food do
    name { Faker::Lorem.words(3).join }
  end

  factory :food_long_name, class: :food do
    name { Faker::Lorem.characters(20) }
  end

  factory :food_short_name, class: :food do
    name { Faker::Lorem.characters(3) }
  end

  trait :with_tastes do
    after(:create) do |food, evaluator|
      create_list(:food_taste, 5, food: food)
    end
  end
end
