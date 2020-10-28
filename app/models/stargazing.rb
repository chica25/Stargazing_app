class Stargazing < ApplicationRecord
    belongs_to :astrophotographer
    belongs_to :constellation

end
#     def self.alpha_order
#         order('location')
#     end
# end
