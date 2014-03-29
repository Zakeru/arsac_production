class CreateMaestrodeobras < ActiveRecord::Migration
  def change
    create_table :teacherofworks do |t|
      t.integer :chiefoffront_id
      t.integer :entity_id
      t.string :movil
      t.string :telefono
      t.string :nacimiento
      t.string :correo
      t.string :foto
      t.string :ruc
      t.string :banco_1

      t.timestamps
    end
  end
end
