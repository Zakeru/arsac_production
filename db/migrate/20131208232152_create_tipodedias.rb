class CreateTipodedias < ActiveRecord::Migration
  def change
    create_table :typeofdays do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
