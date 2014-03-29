class AddAprobadoToPartediariodepersonals < ActiveRecord::Migration
  def change
    add_column :partdayliofpeople, :aprobado, :integer
  end
end
