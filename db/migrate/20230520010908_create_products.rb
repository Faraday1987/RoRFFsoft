class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :nombre
      t.text :description
      t.text :images
      t.string :imagen
      t.decimal :oldprpriceice
      t.decimal :oldprice
      t.decimal :realprice
      t.string :warehouse
      t.boolean :is_active
      t.decimal :existencekg
      t.integer :existence
      t.decimal :weight
      t.integer :category_id
      t.integer :supplier_id
      t.decimal :commission_for_sale
      t.decimal :commission_amount
      t.references :categories, null: false, foreign_key: true
      t.references :suppliers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
