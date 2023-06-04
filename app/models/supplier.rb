class Supplier < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_full_text, against: {
        email: 'A',
        phone: 'B',
        company_name: 'C',
        address: 'D',
        contact_name: 'E',
    }

    has_many :products
    has_many :warehouse_records
end
