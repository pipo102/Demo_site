class CreateRUsers < ActiveRecord::Migration
  def change
    create_table :r_users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
