class Ingredient < ActiveRecord::Base
  has_many :recipes_ingredients
  has_many :recipes, through: :recipes_ingredients

  scope :by_name, -> name { where("name ILIKE ?", "#{name}%") }
end
