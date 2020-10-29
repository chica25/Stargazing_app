class Constellation < ApplicationRecord
    has_many :stargazings
    has_many :astrophotographers, through: :stargazings
    validates :constellation_name, presence: true
 
    scope :sorted, -> { order(:constellation_name) }
    scope :close, -> { where('light_years_away_from_earth < 10' )}

end
