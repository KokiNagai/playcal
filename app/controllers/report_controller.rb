class ReportController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :new_user

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      redirect_to request.referrer || root_url
    end
  end

  private

  def report_params
    params.require(:report).permit(:content, :user_id)
  end

  def new_user
    if user_signed_in?
    unless current_user.gender.present?
    redirect_to edit_path
    flash[:alert] = "※ プロフィールの編集を完了してください。"
  end
  end
  end

end
