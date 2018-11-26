class CreateAdminUsers < ActiveRecord::Migration
  def up
    create_table :admin_users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "username"
      t.timestamps null: false
    end
  end

  def down
  	drop_table :admin_users
  end
end
