class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :groups do |t|
      # t.index [:user_id, :group_id]
      # t.index [:group_id, :user_id]
    end

    create_join_table :projects, :groups do |t|
      # t.index [:project_id, :group_id]
      # t.index [:group_id, :project_id]
    end

    # create_table :users_groups, id: false do |t|
    #   t.belongs_to :user
    #   t.belongs_to :group
    # end

    # create_table :projects_groups, id: false do |t|
    #   t.belongs_to :project
    #   t.belongs_to :group
    # end

    add_reference :evaluations, :user, index: true
    add_reference :evaluations, :project, index: true
  end
end
