class AddTouropenToChatboxes < ActiveRecord::Migration[5.2]
  def change
    add_column :chatboxes, :touropen, :boolean, default: true, null: false
  end
end
