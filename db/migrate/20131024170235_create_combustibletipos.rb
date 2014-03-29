class CreateCombustibletipos < ActiveRecord::Migration
  def change
    create_table :fueltypes do |t|
      t.string :tipo
      t.string :combustible

      t.timestamps
    end
  end
end
