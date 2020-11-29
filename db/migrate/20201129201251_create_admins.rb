class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :a_name
      t.string :a_email
      t.string :a_password

      t.timestamps
    end

    create_join_table :admins, :users do |t|
      # t.index [:admin_id, :user_id]
      # t.index [:user_id, :admin_id]
    end

    add_index :admins, :email, unique: true
  end
end
