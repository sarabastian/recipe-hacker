class CreateUsersRecipe < ActiveRecord::Migration[6.0]
  def change
    create_table :users_recipe do |t|
      t.integer :user_id
      t.integer :recipe_id
    end
  end
end
