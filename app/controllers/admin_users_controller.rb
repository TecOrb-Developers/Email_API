class AdminUsersController < ApplicationController
  def index
  end
  def create
  	@user=AdminUser.find_by_email_id(params[:admin][:email_id])
			p "------------------#{@user.inspect}"
		if @user && @user.authenticate(params[:admin][:password])
			session[:user_id]=@user.id
			flash[:notice]="welcome"
			p "------------------#{@user.inspect}"
			flash[:error]="successful login"
			redirect_to admin_user_path(@user.id)
		else
			flash[:error]="user does not exist"
			redirect_to :back
		end
  end
  def destroy
		session[:user_id]=nil
		redirect_to root_path
	end
end
