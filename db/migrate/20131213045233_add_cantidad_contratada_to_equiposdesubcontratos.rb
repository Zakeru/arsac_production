class AddCantidadContratadaToEquiposdesubcontratos < ActiveRecord::Migration
  def change
    add_column :equipmentsofsubcontracts, :cantidad_contratada, :string
  end
end
