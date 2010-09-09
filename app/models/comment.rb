class Comment < ActiveRecord::Base

  validates_presence_of :user_name,:content,:blog_id

  belongs_to :blog

end
