class Category < ApplicationRecord
  has_many :subcategories
  has_many :hikes
  has_many :breweries
end
