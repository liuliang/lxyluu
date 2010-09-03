class BlogCategory < ActiveRecord::Base
  
  has_many :blogs

  validates_presence_of :name

end
