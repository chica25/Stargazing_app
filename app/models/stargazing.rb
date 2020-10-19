class Stargazing < ApplicationRecord
    belongs_to :astrophotographer
    belongs_to :constellation

    # def self.find_by_skatespot_id(id)
    #     self.where(skatespot_id: id)
    # end

    def self.find_by_constellation_id(id)
        where(constellation_id: id)
    end

    # def self.alpha_order
    #     order('weather')
    # end
end
