class RemoveIngredientsColumnFromRecipe < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :ingredient_list
  end
end
