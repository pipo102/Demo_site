class AddPasswordDigestToRusers < ActiveRecord::Migration
  def change
    add_column :r_users, :password_digest, :string
  end
end
