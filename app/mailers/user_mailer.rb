class UserMailer < ApplicationMailer
	def send_mail emails
		mail( :to => emails, :subject => 'Test mails' )
	end
end
