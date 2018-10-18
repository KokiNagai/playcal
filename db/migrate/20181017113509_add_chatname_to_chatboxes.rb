class AddChatnameToChatboxes < ActiveRecord::Migration[5.2]
  def change
    add_column :chatboxes, :chatname, :string
  end
end
