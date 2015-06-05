class Blog < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :description, presence: true, length: { in: 5..200 }
	validates :country, presence: true
	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
    	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

   #  	def self.search(search)
  	# 	if search
   #  			find(:all, :conditions => ['country LIKE ?', "%#{search}%"])
  	# 	else
   #  			@blogs
  	# 	end
  	# end

end
