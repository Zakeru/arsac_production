class AddOperadorToPartedeequipos < ActiveRecord::Migration
  def change
    add_column :partofequipments, :catalogofwork_id, :integer
    add_column :partofequipments, :fueltype_id, :integer
    add_column :partofequipments, :stand_by, :string
    add_column :partofequipments, :mantenimiento, :string
    add_index :partofequipments, :catalogofwork_id
  end
end
