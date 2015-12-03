class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    UserMailer.
    mail to: @user.email, subject: "Welcome to Share Gear"
  end
