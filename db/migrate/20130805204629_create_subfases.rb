class CreateSubfases < ActiveRecord::Migration
  def change
    create_table :subphases do |t|
      t.string :codigo
      t.string :descripcion
      t.integer :phase_id

      t.timestamps
    end
  end
end
