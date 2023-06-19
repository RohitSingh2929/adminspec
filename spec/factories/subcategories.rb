FactoryBot.define do
    factory :subcategory do
        name { Faker::Name }
        association :category
    end
  end
  