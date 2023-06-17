class ChangeUsersnameToUsernameInUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    remove_column :users, :usersname, :string
  end
end
