class CreatePartidasdecontrols < ActiveRecord::Migration
  def change
    create_table :itemsofcontrols do |t|
      t.integer :phase_id
      t.integer :subphase_id
      t.integer :sector_id
      t.integer :subsector_id
      
      t.timestamps
    end
  end
end
