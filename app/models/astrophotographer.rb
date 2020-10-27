class Astrophotographer < ApplicationRecord
    has_many :stargazings
    has_many :constellations, through: :stargazings
    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :username, length: {minimum: 4 }
    
    # scope :alpha, -> { order(:username) }

    def self.first_five
        all.limit(5)
      end


    def self.from_omniauth(auth) 
        find_or_create_by(username: auth[:info][:email]) do |user|
        user.password = SecureRandom.hex(15)
        end
    end

end



