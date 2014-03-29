class AddFrenteToTrabajadores < ActiveRecord::Migration
  def change
    add_column :workers, :front_id, :integer
    add_index :workers, :front_id
  end
end
