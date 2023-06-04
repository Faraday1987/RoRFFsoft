class Client < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_full_text, against: {
        email: 'A',
        phone: 'B',
        nombre: 'C',
        address: 'D',
        cp: 'E',
        contact_name: 'F',
    }

    has_many :sales
end
