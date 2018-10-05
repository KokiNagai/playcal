class MailSenderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_sender_mailer.inquiry.subject
  #
  def inquiry(contact)
    @contact = contact
    mail(to: @contact.email, from: 'playcalinfo@gmail.com', subject: 'お問い合わせ通知')
  end

  def inquiry1(contact)
    @contact = contact
    mail(to: 'playcalinfo@gmail.com')
  end
end
