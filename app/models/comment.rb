class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many :likes, dependent: :destroy
end
