class CreateValesdeconsumos < ActiveRecord::Migration
  def change
    create_table :voucherofmeals do |t|
      t.string :numero_vale
      t.integer :groupsofwork_id
      t.string :tipo_vale
      t.integer :supplier_id
      t.string :tipo_material
      t.float :cantidad
      t.date :fecha_de_ingreso
      t.integer :front_id

      t.timestamps
    end
    add_index :voucherofmeals, :groupsofwork_id
    add_index :voucherofmeals, :supplier_id
    add_index :voucherofmeals, :front_id
  end
end
