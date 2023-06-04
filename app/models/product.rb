class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    nombre: 'A',
    description: 'B',
    sku: 'C',
  }
  # belongs_to :categories, class_name: 'Category'
  # belongs_to :suppliers, class_name: 'Supplier'
  belongs_to :categories, class_name: 'Category', foreign_key: 'categories_id'
  belongs_to :suppliers, class_name: 'Supplier', foreign_key: 'suppliers_id'

  # has_many :warehouse_records
  def self.buscador(termino)
    Product.where("nombre_producto LIKE ?", "%#{termino}%")
  end
end
