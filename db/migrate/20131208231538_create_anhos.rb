class CreateAnhos < ActiveRecord::Migration
  def change
    create_table :anhos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
