class AddDefaultToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :cars do |t|
      t.change_default(:rating, 3.0)
    end
    change_table :users do |t|
      t.change_default(:rating, 3.0)
    end
  end
end
