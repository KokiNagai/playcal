class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :from_id
      t.integer :to_id

      t.timestamps
    end
  end
end
