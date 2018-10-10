class NotificationsController < ApplicationController
  def link_through
    @notifications = current_user.notifications
    @notifications.update read: true
    redirect_to inbox_path
  end
end
