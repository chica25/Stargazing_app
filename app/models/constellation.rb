class Constellation < ApplicationRecord
    has_many :stargazings
    has_many :astrophotographers, through: :stargazings
    # add validation for description lenght or character limit 
end
