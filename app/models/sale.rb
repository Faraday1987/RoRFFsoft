class Sale < ApplicationRecord
    belongs_to :client, optional: true
    has_many :sale_details

    # has_many :sale_details, dependent: destroy

end
