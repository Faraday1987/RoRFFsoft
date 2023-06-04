class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :company_name
      t.string :imageurl
      t.string :country
      t.string :address
      t.string :address2
      t.string :cp
      t.string :city
      t.boolean :is_active
      t.string :contact_name
      t.string :email
      t.string :phone
      t.string :phone2
      t.float :commission_amount

      t.timestamps
    end
  end
end
