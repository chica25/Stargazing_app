class Astrophotographer < ApplicationRecord
    has_many :stargazings
    has_many :constellations, through: :stargazings
end
