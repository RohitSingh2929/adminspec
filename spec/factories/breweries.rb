FactoryBot.define do
    factory :brewery do
      name { Faker::Name }
      beer_style { "IPA" }
      association :category
      association :subcategory
    end
  end
  