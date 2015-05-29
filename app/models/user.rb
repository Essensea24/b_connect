class User < ActiveRecord::Base
	has_secure_password #put in a required encrypted password
	has_many :blogs
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true
	validates :email, presence: true
	validates :about_me, presence: true,
			length: { minimum: 5 }
			

                    
end
