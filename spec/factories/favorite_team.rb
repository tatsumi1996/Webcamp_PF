FactoryBot.define do
  factory :favorite_team do
    name { Faker::Lorem.characters(number:5) }
  end
end