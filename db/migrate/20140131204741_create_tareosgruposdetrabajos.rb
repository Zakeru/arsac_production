class CreateTareosgruposdetrabajos < ActiveRecord::Migration
  def change
    create_table :tareosgroupsofworks do |t|
      t.integer :tareo_id
      t.string :nombre

      t.timestamps
    end
  end
end
