module ApplicationHelper
	def current_user
	 @current_user ||= AdminUser.find(session[:user_id])  if session[:user_id]
  end
  def eml
  # 	user=AdminUser.find(1)
  # 	send_by = user.activemails.where(:status=>true).first
		# hs={:email=>send_by.defaultemail.email,:pass=>send_by.defaultemail.pass}
		hs={:email=>"fun.all.here@gmail.com",:pass=>"escort@tecorb"}
	end
	def available_emails
		@all_default = Defaultemail.all
		p "======default emails===#{@all_default.pluck(:email)}"
		@available=[]
		current_user.activemails.destroy_all
		@all_default.each do |e|
			today_send = SendEmail.where(:created_at=>Date.today,:email=>e.email).count
			if today_send<=0
				current_user.activemails.create(:defaultemail_id=>e.id,:status=>false)
				@available<<e.email
			end
		end
		p "=========active mails======#{current_user.activemails.inspect}"
		@available
	end

	def required_emails total
		p "-------------total emails------#{total}"
		dv=(total.to_f/500)
		int=dv.to_i
		dv>int ? dv.to_i+1 : dv.to_i

	end
end
