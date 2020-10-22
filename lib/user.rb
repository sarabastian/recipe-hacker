class User < ActiveRecord::Base
    has_many :recipes, through: :users_recipes
    has_many :users_recipes
end