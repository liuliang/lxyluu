class Blog < ActiveRecord::Base
  
  cattr_reader :per_page
  @@per_page = 10

  validates_presence_of :title,:content,:blog_category_id,:user_id

  belongs_to :user
  belongs_to :blog_category
  has_many :comments

  named_scope :public,:conditions => ['flag = 0 and is_private = 0']
  named_scope :private,:conditions => ['flag = 0 and is_private = 1']
  named_scope :available,:conditions => ['flag = 0']

  def others(num=5)
    return  Blog.public.find(:all,:limit=>num,:order=>'created_at desc')
#    if self.tags.blank?
#    arr_tags = []
#    self.tags.scan{ |t| arr_tags << self.tags  }
#    Blog.public.find(:all,:conditions)
  end

  def self.privates
    {0=>'公开',1=>'私有'}
  end

end
