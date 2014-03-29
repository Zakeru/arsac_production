class AddAprobadoToPartedeequipos < ActiveRecord::Migration
  def change
    add_column :partofequipments, :aprobado, :integer
  end
end
