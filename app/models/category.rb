class Category < ApplicationRecord
    # Asociaciones
    has_many :products
    # belongs_to :parent, class_name: "Category", optional: true
    belongs_to :categories, class_name: 'Category', optional: true # Make sure the class name is correct

    # has_many :children, class_name: "Category", foreign_key: "parent_id"

    # # Validaciones
    validates :nombre, presence: true
    validates :descripcion, presence: true

    # # Otros métodos y lógica de negocio
end
