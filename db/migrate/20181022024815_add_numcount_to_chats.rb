class AddNumcountToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :goods_count, :integer
  end
end
