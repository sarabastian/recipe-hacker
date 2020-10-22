class DropIngredientsTable < ActiveRecord::Migration[6.0]
    def change
      drop_table :ingredients do |t|
        t.string :name, null: false
        t.integer :user_id, null: false
        t.integer :recipe_id, null: false
      end
    end
end
