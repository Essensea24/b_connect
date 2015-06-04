class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
	def welcome(user)
		@greeting = "Hello #{user.first_name}. Thank you for joining B_Connect. I hope you enjoy your time with us."

		mail to: user.email, subject: "Welcome to B_Connect! #{user.first_name.upcase}", from: "sokpheakc@gmail.com"

	end

end
