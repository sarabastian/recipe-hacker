class User < ActiveRecord::Base
    has_many :recipes, through: :ingredients
    has_many :ingredients
end