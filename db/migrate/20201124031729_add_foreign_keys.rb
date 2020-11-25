class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :users_groups, id: false do |t|
      t.belongs_to :user
      t.belongs_to :group
    end

    create_table :projects_groups, id: false do |t|
      t.belongs_to :project
      t.belongs_to :group
    end

    add_reference :evaluations, :user, index: true
    add_reference :evaluations, :project, index: true
  end
end
