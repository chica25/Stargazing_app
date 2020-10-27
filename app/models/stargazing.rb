class Stargazing < ApplicationRecord
    belongs_to :astrophotographer
    belongs_to :constellation
    # belongs_to :constellation, required: false

    
# def self.from_today
#     where("created_at >=?", Time.zone.today.beginning_of_day)
#   end

    # def self.find_by_constellation_id(id)
    #     where(constellation_id: id)
    # end

    # def self.alpha_order
    #     order('constellation_name')
    # end
end
