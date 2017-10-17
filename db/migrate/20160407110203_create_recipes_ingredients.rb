class CreateRecipesIngredients < ActiveRecord::Migration
  def change
    create_table :recipes_ingredients do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.float :quantity

      t.timestamps null: false
    end
  end
end
