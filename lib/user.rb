class User < ActiveRecord::Base
    has_many :predictions, through: :zodiac_sign
    has_one :zodiac_sign
end