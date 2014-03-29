class AddAprobadoToParteobras < ActiveRecord::Migration
  def change
    add_column :partworks, :aprobado, :integer
  end
end
