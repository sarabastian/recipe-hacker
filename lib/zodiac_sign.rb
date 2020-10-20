class ZodiacSign < ActiveRecord::Base
    belongs_to :user
    belongs_to :prediction
end