class ChangeUsersnameToUsernameInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :usersname, :string
    add_column :users, :username, :string
  end
end
