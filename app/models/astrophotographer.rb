class Astrophotographer < ApplicationRecord
    has_many :stargazings
    has_many :constellations, through: :stargazings
    has_secure_password
    validates :user_name, presence: true, uniqueness: { case_sensitive: false }  
end
