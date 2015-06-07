class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  belongs_to :comment
end
