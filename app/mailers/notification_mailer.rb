class NotificationMailer < ApplicationMailer
  def inquiry3(reciever, sender)
    @reciever = reciever
    @sender = sender
     mail (
      subject: "あなたの投稿に#{@sender.name}さんからコメントが届いています！",
      from: 'playcalinfo@gmail.com',
      to: @reciever.email
    )
  end
end
