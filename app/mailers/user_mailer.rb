class UserMailer < ActionMailer::Base
  def welcome_mail(user)
    @user = user
    attachments["rails.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail(:to => user.email, :from => "prasantakumarswain37@gmail.com", :subject => "welcome to blogapp")
  end
end
