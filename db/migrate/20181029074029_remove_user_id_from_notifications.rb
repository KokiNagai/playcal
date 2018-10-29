class RemoveUserIdFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_reference :notifications, :user, foreign_key: true
    remove_reference :notifications, :post, foreign_key: true
    remove_reference :notifications, :notified_by, foreign_key: true
  end
end
