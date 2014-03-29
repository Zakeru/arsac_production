class CreatePartediariodepersonals < ActiveRecord::Migration
  def change
    create_table :partdayliofpeople do |t|
      t.string :numero
      t.integer :groupsofwork_id
      t.date :fecha

      t.timestamps
    end

    add_index :partdayliofpeople, :groupsofwork_id
  end
end
