class Astrophotographer < ApplicationRecord
    has_many :stargazings
    has_many :constellations, through: :stargazings
    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: false }  
    validates :username, length: {minimum: 4 }
    # add bio validation - length or character limit 
    
    def self.from_omniauth(auth) #=> user that's found or user that's created
            find_or_create_by(username: auth[:info][:email]) do |user|
            user.password = SecureRandom.hex(15)
        end
    end
end