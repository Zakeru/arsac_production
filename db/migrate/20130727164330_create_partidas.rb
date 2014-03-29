class CreatePartidas < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :diametro
      t.string :serieclase
      t.string :profundidad
      t.integer :unit_id
      t.string :metrado
      t.string :observacion
      t.integer :partwork_id
      t.string :terreno

      t.timestamps
    end
    add_index :items, :unit_id
  end
end
