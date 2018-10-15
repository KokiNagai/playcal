class ReportController < ApplicationController
  before_action :authenticate_user!, only: [:create]

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
end
