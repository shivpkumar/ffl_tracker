class AdminsTable < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :first_name, :last_name, :email, :password_digest
      t.timestamps
    end
  end
end
