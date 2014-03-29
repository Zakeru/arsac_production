class CreateFrentes < ActiveRecord::Migration
  def change
    create_table :fronts do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
