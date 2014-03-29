class CreateListacategorias < ActiveRecord::Migration
  def change
    create_table :listcategories do |t|
      t.string :codigo
      t.string :nombre
      t.integer :importlist_id
      
      t.timestamps
    end
    add_index :listcategories, :importlist_id
  end
end
