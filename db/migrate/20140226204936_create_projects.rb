class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :project_initial_date

      t.timestamps
    end
  end
end
