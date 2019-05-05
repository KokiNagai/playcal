class NotificationsController < ApplicationController
  before_action :new_user

  def link_through
    @notifications = current_user.notifications
    @notifications.update(read: true)
    redirect_to message_path
  end

  private
  # プロフィール完成前アクセス拒否
  def new_user
    if user_signed_in?
      unless current_user.gender.present?
        redirect_to edit_user_registration_path
        flash[:alert] = "※ プロフィールの編集を完了してください。"
      end
    end
  end

end
