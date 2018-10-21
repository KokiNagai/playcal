class AddTourgradeToChatboxes < ActiveRecord::Migration[5.2]
  def change
    add_column :chatboxes, :tourgrade, :string
  end
end
