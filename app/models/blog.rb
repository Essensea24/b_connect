class Blog < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :title, presence: true
	validates :description, presence: true,
			length: { in: 5..200 }
	validates :country, presence: true	
end
