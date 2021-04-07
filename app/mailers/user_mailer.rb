class UserMailer < ApplicationMailer
  default from: 'no-reply@gcodesimpleapp.com'

  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/activate?id=#{user.id}&sent_time=#{Time.now.to_i}"
    mail(to: @user.email, subject: 'Welcome to My demo Site')
  end
end
