class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :time_to_prepare
      t.integer :yield
      t.string :method_of_preparation, array: true, default: []

      t.timestamps null: false
    end
  end
end
