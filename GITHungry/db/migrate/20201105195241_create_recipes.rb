class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :ingredients
      t.text :instructions
      t.string :cuisine_type
      t.integer :cooking_time
      t.string :tags
      t.integer :user_ratings, :default => 0
      t.integer :servings
      t.text :user_comments
      t.string :meal_type

      t.timestamps
    end
  end
end
