class CreateInsumos < ActiveRecord::Migration
  def change
    create_table :inputs do |t|      
      t.string :cantidad
      t.string :pu_sin_igv
      t.string :parcial
      t.string :descripcion
      t.integer :unit_id
      t.integer :list_id
      t.integer :subcontract_id

      t.timestamps
    end
    add_index :inputs, :unit_id
    add_index :inputs, :list_id
    add_index :inputs, :subcontract_id
  end
end
