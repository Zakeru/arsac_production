class AddEquiposdesubcontratosFechaToEquiposdesubcontratos < ActiveRecord::Migration
  def change
    add_column :equipmentsofsubcontracts, :fecha, :date
  end
end
