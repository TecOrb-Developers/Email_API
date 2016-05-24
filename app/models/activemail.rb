class Activemail < ActiveRecord::Base
  belongs_to :defaultemail
  belongs_to :admin_user
end
