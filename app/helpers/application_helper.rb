module ApplicationHelper
	def current_user
  	 @current_user ||= AdminUser.find(session[:user_id])  if (session[:user_id])
    end
end
