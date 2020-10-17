class Constellation < ApplicationRecord
    has_many :stargazings
    has_many :astrophotographers, through: :stargazings
    validates :constellation_name, presence: true
    validates :constellation_name, presence: { message: "is required" }
    validates :description, presence: true, length: { maximum: 200 }
        # for search constellations names that are less than 7
    scope :by_titles, -> (n = 7 ) { where("LENGTH(constellation_name) < ?", n)} 

    def self.search(search)
        if search
            self.where('name LIKE ?', "%#{search}%")
        else
            self.all
        end
    end


   # breakdown of accepts_nested_attributes_for macro

    # def stargazing_attributes(stargazing_attributes)
    #     stargazing = Stargazing.create(stargazing_attributes)
    #     self.stargazing = stargazing
    #     self.save
    # end
end
