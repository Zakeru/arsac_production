class CreateSubsectores < ActiveRecord::Migration
  def change
    create_table :subsectors do |t|
      t.string :codigo
      t.string :descripcion
      t.integer :sector_id

      t.timestamps
    end
  end
end
