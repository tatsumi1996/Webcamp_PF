FactoryBot.define do
  factory :support do
    title { Faker::Lorem.characters(number:5) }
    body { Faker::Lorem.characters(number:20) }
    association :user
  end
end