class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :usersname
      t.string :email
      t.float :rating
      t.string :avatar_image

      t.timestamps
    end
  end
end
