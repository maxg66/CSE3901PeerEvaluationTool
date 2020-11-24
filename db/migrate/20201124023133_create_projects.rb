class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :p_name
      t.string :project_type
      t.date :due_date

      t.timestamps
    end
  end
end
