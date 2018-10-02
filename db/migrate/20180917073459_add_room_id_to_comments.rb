class AddRoomIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :room_id, :integer
  end
end
