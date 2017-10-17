class Recipe < ActiveRecord::Base
	has_many :recipes_ingredients
  has_many :ingredients, through: :recipes_ingredients

  accepts_nested_attributes_for :ingredients

  def self.search_by_ingredients(ingredients)
    if ingredients.present?
      recipes = {}
      ingredients.each do |i|
        Recipe.joins("JOIN recipes_ingredients ON recipes.id = recipes_ingredients.recipe_id")
              .joins("JOIN ingredients ON ingredients.id = recipes_ingredients.ingredient_id")
              .where("ingredients.name ILIKE ?", "#{i}").each do |r|
                recipes.has_key?(r) ? recipes[r] += 1 : recipes[r] = 1
              end
      end

      (recipes.sort_by {|recipe, n| n}).reverse.collect {|x| x[0]}
    else
      all
    end
  end
end
