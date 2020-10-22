class Stargazing < ApplicationRecord
    belongs_to :astrophotographer
    belongs_to :constellation
    
    # def self.find_by_constellation_id(id)
    #     where(constellation_id: id)
    # end

    # def self.alpha_order
    #     order('constellation_name')
    # end
end
