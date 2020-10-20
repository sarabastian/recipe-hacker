class Prediction < ActiveRecord::Base
    has_many :users, through: :zodiac_sign
    has_one :zodiac_sign
end