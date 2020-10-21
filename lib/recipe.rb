class Recipe < ActiveRecord::Base
    has_many :users, through: :ingredients
    has_many :ingredients
end