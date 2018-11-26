class AddPasswordDigestToAdminUsers < ActiveRecord::Migration
  def up
  	add_column "admin_users", "password_digest", :string
  	add_column "admin_users", "email", :string, limit: 100
  end

  def down
  	remove_column "admin_users", "password_digest"
  	remove_column "admin_users", "email"
  end
end
