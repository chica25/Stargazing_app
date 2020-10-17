class Constellation < ApplicationRecord
    has_many :stargazings
    has_many :astrophotographers, through: :stargazings
    validates :constellation_name, presence: true
    validates :constellation_name, presence: { message: "is required" }
     validates :description, presence: true, length: { maximum: 200 }
   # add validation for description lenght or character limit 


   # breakdown of accepts_nested_attributes_for macro

    def stargazing_attributes(stargazing_attributes)
        stargazing = Stargazing.create(stargazing_attributes)
        self.stargazing = stargazing
        self.save
    end
end
