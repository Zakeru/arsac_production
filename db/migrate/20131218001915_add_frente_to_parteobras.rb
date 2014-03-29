class AddFrenteToParteobras < ActiveRecord::Migration
  def change
    add_column :partworks, :front_id, :integer
    add_index :partworks, :front_id
  end
end
