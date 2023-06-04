class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :nombre
      t.string :descripcion
      t.string :imageurl

      t.timestamps
    end
  end
end
