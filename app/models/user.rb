class User < ActiveRecord::Base
	has_secure_password #put in a required encrypted password
	has_many :blogs
	has_many :comments
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true
	validates :email, presence: true
	validates :about_me, presence: true,
			length: { in: 5..200 }
	validates :password, length: { in: 6..20 }
			

                    
end
