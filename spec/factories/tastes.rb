# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :taste do
    name { Faker::Lorem.characters(20) }
    initialize_with { Taste.find_or_create_by(name: name) }
  end
end
