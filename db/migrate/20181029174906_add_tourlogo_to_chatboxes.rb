class AddTourlogoToChatboxes < ActiveRecord::Migration[5.2]
  def change
    add_column :chatboxes, :tourlogo, :string
  end
end
