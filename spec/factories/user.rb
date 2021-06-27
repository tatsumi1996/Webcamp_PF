FactoryBot.define do
  factory :user do
    email { Faker::Lorem.characters(number:10) }
    password { Faker::Lorem.characters(number:6) }
  end
end