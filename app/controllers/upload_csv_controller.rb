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
       flash[:notice] = "File imported"
  		 redirect_to send_email_form_path(:emails=>@emails)
    else
      flash[:notice]="file extension not same"
      redirect_to :back
    end 
  end

  def send_email_form
  	@em=params[:emails].count
  	p"-------#{@em}"
  	params[:emails].present? ? @emails_str=params[:emails].join(',') : @emails_str=nil
  end

	def send_email
		if params[:emails].strip !=''
			em=params[:emails].split(',')
			em.count
			em.each do |e|
				p"----#{e}"
			UserMailer.send_mail(e).deliver_now 
			#em.each do |e|
				SendEmail.create(:email=>e)
			end
			flash[:notice]="Mail sent successfully"
			redirect_to :back
		else
			flash[:error]="Can't send mail right now"
			redirect_to :back
		end
	end

end
