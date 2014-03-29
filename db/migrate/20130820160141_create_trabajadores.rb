class CreateTrabajadores < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.integer :partdayliofperson_id
      t.integer :catalogofwork_id
      t.integer :catalogcategorywork_id
      t.integer :itemsofcontrol_id
      t.string :normal
      t.string :normal_60
      t.string :normal_100
      t.string :total_horas

      t.timestamps
    end
    add_index :workers, :partdayliofperson_id
    add_index :workers, :catalogofwork_id
    add_index :workers, :catalogcategorywork_id
    add_index :workers, :itemsofcontrol_id
  end
end
