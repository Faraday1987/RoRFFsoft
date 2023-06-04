class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.integer :user_id
      t.decimal :importe
      t.float :amount
      t.date :date
      t.float :weight

      t.timestamps
    end
  end
end
