class Constellation < ApplicationRecord
    has_many :stargazings
    has_many :astrophotographers, through: :stargazings
    validates :constellation_name, presence: true
    validates :description, presence: true, length: { maximum: 200 }

    
  
   #ActiveRecord query 2
#    scope :alpha, -> { order(:constellation_name)}
    scope :sorted, -> { order(:constellation_name) }

end
