class AddDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_table :cars do |t|
      t.change_default(:rating, 3.5)
    end


  end
end
