class CreateImportalistas < ActiveRecord::Migration
  def change
    create_table :importlists do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
