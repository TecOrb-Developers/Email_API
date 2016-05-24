class UploadCsvController < ApplicationController
  require 'csv'

  def all_emails
  	@emails=SendEmail.all.order(created_at: 'ASC')
  end


  def upload_emails_csv
    file=params[:email_upload][:email]
    @i=1
	  @status=false
	  @emails=[]
    if File.extname(file.original_filename)=='.csv'
      CSV.foreach(file.path) do |row|
	      if @i==1
				   p "-------------------#{row.inspect}"
				  if row[0] == "emails"
					  @status = true
				  else
					 @status = false
					  break 
				  end
				else
	        @emails << row[0]
		    end
        @i+=1
      end
       flash[:notice] = "File imported. Total emails are #{@emails.count}"
  		 redirect_to send_email_form_path(:emails=>@emails)
    else
      flash[:notice]="file extension not same"
      redirect_to :back
    end 
  end

  def send_email_form
  	@total=params[:emails].count
  	@req_emails = required_emails(@total)
		p "-------------required emails------#{@req_emails}"  	
  	@send_by_emails= available_emails
  	p "************available emails------------#{@send_by_emails}"
  	params[:emails].present? ? @emails_str=params[:emails].join(',') : @emails_str=nil
  end

	def send_email
		if params[:emails].strip !=''
			em=params[:emails].split(',')
			# @incount=@count=0
			em.each do |e|
				# @count+=1
				# p "...........#{@count}  email is sending"
				# if [1,500,1000,1500,2000].include?(@count)
				# 	current_user.activemails.update_all(:status => false)
				# 	@by = current_user.activemails[@incount]
				# 	@by.update_attributes(:status=>true) if @by.present?
				# 	p "---------Send by email----#{@by.inspect}"
				# 	@incount+=1
				# end
				UserMailer.send_mail(e).deliver_now 
				SendEmail.create(:email=>e)	
				sleep [1,2,3].sample			
			end
			flash[:notice]="Mail sent successfully"
			redirect_to :back
		else
			flash[:error]="Can't send mail right now"
			redirect_to :back
		end
	end

end
