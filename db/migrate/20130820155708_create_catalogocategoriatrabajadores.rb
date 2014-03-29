class CreateCatalogocategoriatrabajadores < ActiveRecord::Migration
  def change
    create_table :catalogcategoryworks do |t|
      t.string :nombre      
      t.integer :unit_id
      t.string :precio_unitario_normal
      t.string :precio_unitario_60
      t.string :precio_unitario_100

      t.timestamps
    end
    add_index :catalogcategoryworks, :unit_id
  end
end
