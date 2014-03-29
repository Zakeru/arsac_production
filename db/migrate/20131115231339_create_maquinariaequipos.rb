class CreateMaquinariaequipos < ActiveRecord::Migration
  def change
    create_table :machineryequipments do |t|
      t.string :nombre
      t.integer :reportofequipment_id

      t.timestamps
    end
    add_index :machineryequipments, :reportofequipment_id
  end
end
