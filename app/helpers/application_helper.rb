module ApplicationHelper
	def current_user
  	 @current_user ||= AdminUser.find(session[:user_id])  if (session[:user_id])
    end
    def eml
    	@emails=EmailSend.all
    	 email=EmailSend.select("email as email,cretated_at as cretated_at")
		hs={}
		hs["email"]="email.email"
		hs["pass"]="email.password"
		hs
		# "fun.all.here@gmail.com"
	end
end
