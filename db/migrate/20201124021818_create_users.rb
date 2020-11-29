class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :u_name
      t.string :email
      t.string :password
      #t.string :account_type

      t.timestamps
    end
  end
end
