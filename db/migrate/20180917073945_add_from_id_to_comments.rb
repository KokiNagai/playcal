class AddFromIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :from_id, :integer
  end
end
