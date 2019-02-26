class NotificationMailer < ApplicationMailer
  default from: "playcalinfo@gmail.com"

 def send_like_to_user(user)
   @user = user
   mail(
     from: '"Playcal運営局" <playcalinfo@gmail.com>',
     subject: "#{@user.name}さんにいいねが届いています！", #メールのタイトル,
     to: @user.email #宛先
   ) do |format|
     format.html
   end
 end
end
