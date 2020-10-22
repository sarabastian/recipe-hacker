class Recipe < ActiveRecord::Base
    has_many :users, through: :users_recipes
    has_many :users_recipes
end