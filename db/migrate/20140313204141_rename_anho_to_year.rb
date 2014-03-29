class RenameAnhoToYear < ActiveRecord::Migration
  def change
  	rename_table :anhos, :years
  end
end
