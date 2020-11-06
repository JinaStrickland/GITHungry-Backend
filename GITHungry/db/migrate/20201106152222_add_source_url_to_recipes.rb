class AddSourceUrlToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :sourceURL, :string
  end
end
