class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :imageurl
      t.string :country
      t.string :address
      t.string :address2
      t.string :cp
      t.string :city
      t.string :state
      t.string :contact_name
      t.string :email
      t.string :phone
      t.float :commission_amount

      t.timestamps
    end
  end
end
