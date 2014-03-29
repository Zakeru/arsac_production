class AddCatalogocategoriatrabajadoresToCatalogodetrabajadores < ActiveRecord::Migration
  def change
    add_column :catalogofworks, :catalogcategorywork_id, :integer
    add_index :catalogofworks, :catalogcategorywork_id
  end
end
