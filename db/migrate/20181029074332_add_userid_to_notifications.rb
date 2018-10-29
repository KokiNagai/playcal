class AddUseridToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :user_id, :integer
    add_column :notifications, :post_id, :integer
    add_column :notifications, :notified_by_id, :integer
  end
end
