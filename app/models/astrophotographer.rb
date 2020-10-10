class Astrophotographer < ApplicationRecord
    has_many :stargazings
    has_many :constellations, through: :stargazings
    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: false }  
    #validates :username, length: {minimum: 4 }
    # add validation for bio lenght or character limit 
    
end
