class User < ActiveRecord::Base
	has_secure_password #put in a required encrypted password
end
