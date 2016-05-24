class Defaultemail < ActiveRecord::Base
	has_many :activemails ,:dependent=>:destroy
end
