class Stargazing < ApplicationRecord
    # belongs_to :astrophotographer
    belongs_to :constellation
    accepts_nested_attributes_for :constellation
end
