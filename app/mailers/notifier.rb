class Notifier < ActionMailer::Base
  default from: "sitemail@wilhelser.com"

  def welcome_email(user)
    @user = user

    mail :to => @user.email, :bcc => "wil@wilhelser.com", :subject => "Welcome to Member Benefits"
  end
end
