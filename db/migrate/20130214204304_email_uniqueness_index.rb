class EmailUniquenessIndex < ActiveRecord::Migration
  def up
    add_index :r_users, :email, unique: true
  end

  def down
    remove_index :r_users, :email
  end
end
