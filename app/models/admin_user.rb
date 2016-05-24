class AdminUser < ActiveRecord::Base
  has_secure_password
  has_many :activemails ,:dependent=>:destroy
end
