class CreateListas < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :codigo
      t.string :nombre
      t.integer :unit_id
      t.string :precio_unitario        
      t.integer :listcategory_id

      t.timestamps
    end
    add_index :lists, :unit_id
  end
end
