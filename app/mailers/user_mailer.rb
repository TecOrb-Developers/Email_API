class UserMailer < ApplicationMailer
	
	def send_mail emails
		delivery_options = {   user_name: 'fun.all.here@gmail.com',
                         password: 'escort@tecorb',
                         address: 'smtp.gmail.com' }
		mail( :to => emails, :subject => 'Test mails',:delivery_method_options => delivery_options)
	end
end
