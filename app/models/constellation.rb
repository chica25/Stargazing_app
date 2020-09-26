class Constellation < ApplicationRecord
    has_many :stargazings
    has_many :astrophotgraphers, through: :stargazing
end
