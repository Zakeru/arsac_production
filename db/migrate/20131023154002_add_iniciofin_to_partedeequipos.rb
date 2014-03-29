class AddIniciofinToPartedeequipos < ActiveRecord::Migration
  def change
    add_column :partofequipments, :inicio, :string
    add_column :partofequipments, :fin, :string
    add_column :partofequipments, :diferencia, :string
    add_column :partofequipments, :combustible_cantidad, :string
  end
end
