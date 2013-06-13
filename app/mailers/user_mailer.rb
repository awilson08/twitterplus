class UserMailer < ActionMailer::Base
  default from: "TwitterPlus"

  def new_user_email(user)
  	@user = user
  	mail(:to => user.emailaddress, :subject => "Welcome to Twitter Plus")
  end
end
