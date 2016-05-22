class UploadCsvController < ApplicationController
  require 'csv'

  def index
  end
  def all_emails
  	@emails=UserEmail.all
  	email=Array.new
  	@emails.each do |e| 
  	  email<<e
    end
  	render json:{code:'500',message:'succesfully',data:@results.as_json(except:[:created_at,:updated_at,:sub_category_id,:category_id,:id])}
  end

  def create
	    file=params[:email_upload][:email]
	    @i=1
		@status=false
	    if File.extname(file.original_filename)=='.csv'
	      CSV.foreach(file.path) do |row|
		      if @i==1
					   p "-------------------#{row.inspect}"
					  if row[0] == "id" and row[1] == "emails"
						  @status = true
					  else
						 @status = false
						  break 
					  end
					else
		        @email=EmailRecord.find_by_email(row[1])
		        if !@email
		        	email=Array.new
		          @email=EmailRecord.create(:email=>row[1])
		          email<<@email.email
		          @str=email.join(',')
		          p"-------#{email}"
		        else
	              @email.update_attributes(:email=>row[1])
	              p"-------#{email}"
	            end
			    end
	        @i+=1
	      end
	       flash[:notice] = "File imported"
    		  redirect_to upload_csv_path(@email.id)
	    else
	      flash[:notice]="file extension not same"
	      redirect_to :back
	    end 
  end

	def new
	end

	def show
	  
  end
end
