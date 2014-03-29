class AddPrecioToCombustibletipos < ActiveRecord::Migration
  def change
    add_column :fueltypes, :precio, :string
  end
end
