class AddForeignKeysToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :user_id, :integer
    add_column :ingredients, :recipe_id, :integer
  end
end
