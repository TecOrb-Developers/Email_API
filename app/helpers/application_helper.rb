module ApplicationHelper
	def current_user
  	 @current_user ||= AdminUser.find(session[:user_id])  if (session[:user_id])
    end
    def eml
		hs={}
		hs["email"]="loveyhtu21@gmail.com"
		hs["pass"]="jailovesyou"
		hs
		# "fun.all.here@gmail.com"
	end
end
