class Subcategory < ApplicationRecord
  has_many :hikes
  has_many :breweries
  belongs_to :category
end
