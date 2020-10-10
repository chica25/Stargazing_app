class Stargazing < ApplicationRecord
    belongs_to :astrophotographer
    belongs_to :constellation
end
