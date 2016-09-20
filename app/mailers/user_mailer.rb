class UserMailer < ApplicationMailer
  default from: 'gohappybabysitter@gmail.com'

  def welcome_email(user)
    @user = user
    @url = "https:localhost:3000"
    mail(to: @user, subject: "Welcome to GoHappy", body: "Your account has been successfully created")
  end
end
