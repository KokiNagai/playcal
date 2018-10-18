class AddChattermToChatboxes < ActiveRecord::Migration[5.2]
  def change
    add_column :chatboxes, :chatterm, :string
  end
end
