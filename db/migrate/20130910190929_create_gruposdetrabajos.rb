class CreateGruposdetrabajos < ActiveRecord::Migration
  def change
    create_table :groupsofworks do |t|
      t.integer :sector_id
      t.integer :subsector_id
      t.integer :chiefoffront_id
      t.integer :subcontract_id
      t.integer :teacherofwork_id
      t.string :activo

      t.timestamps
    end
    add_index :groupsofworks, :sector_id
    add_index :groupsofworks, :subsector_id
    add_index :groupsofworks, :chiefoffront_id
    add_index :groupsofworks, :subcontract_id
    add_index :groupsofworks, :teacherofwork_id
  end
end
