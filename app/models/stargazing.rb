class Stargazing < ApplicationRecord
    belongs_to :astrophotographer
    belongs_to :constellation
    validates :location, presence: true

end
#     def self.alpha_order
#         order('location')
#     end
# end
