class ContactsController < ApplicationController
  before_action :new_user

  # get お問い合わせ
  def new
    @contact = Contact.new
  end

  # post お問い合せ作成
  def create
    @contact = Contact.new(contact_params)
    MailSenderMailer.inquiry(@contact).deliver
    MailSenderMailer.inquiry1(@contact).deliver
    respond_to do |format|
      @contact.save ? (format.html { redirect_to inquiry_confirm_path }) : (format.html { render action: 'new' })
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:email, :message)
    end

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
