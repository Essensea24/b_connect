class User < ActiveRecord::Base
	has_secure_password #put in a required encrypted password
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	has_many :blogs
	has_many :comments
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }
	validates :about_me, presence: true,
			length: { in: 5..200 }
	validates :password, length: { in: 6..20 }
			

                    
end
