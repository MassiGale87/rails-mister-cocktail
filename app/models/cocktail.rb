class Cocktail < ApplicationRecord
  has_many :ingredients, through: :doses
  has_many :doses
end
