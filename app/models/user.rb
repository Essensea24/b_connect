class User < ActiveRecord::Base
	make_flagger
	has_secure_password #put in a required encrypted password
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	has_many :blogs, dependent: :destroy
	has_many :comments, dependent: :destroy
	
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }
	validates :about_me, presence: true,
			length: { in: 5..200 }
	validates :password, length: { in: 6..20 }
	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
    	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
			

                    
end
