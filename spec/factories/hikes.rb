FactoryBot.define do
    factory :hike do
      name { "Example Hike" }
      difficulty { "Easy" }
      length { 5 }
      association :category
      association :subcategory
    end
end