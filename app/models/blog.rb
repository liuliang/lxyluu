class Blog < ActiveRecord::Base
  
  cattr_reader :per_page
  @@per_page = 10

  validates_presence_of :title,:content,:blog_category_id,:user_id

  belongs_to :user
  belongs_to :blog_category
  has_many :comments

  named_scope :public,:conditions => ['flag = 0 and is_private = 0'],:order=>'created_at desc'
  named_scope :private,:conditions => ['flag = 0 and is_private = 1'],:order=>'created_at desc'
  named_scope :available,:conditions => ['flag = 0'],:order=>'created_at desc'

  after_save :add_tag


# 没增加一个blog 给tags 表增加,用来前台显示
  def add_tag
      self.s_tags.each do |s|
        Tag.create(:name=>s) unless Tag.find_by_name(s)
      end
  end

#  将tags转换成数组
  def s_tags
    if self.tags.blank?
      []
    else
      (self.tags+',').split(',')
    end
  end


  def others(num=5)
    return  Blog.public.find(:all,:limit=>num,:order=>'created_at desc')
    #    if self.tags.blank?
    #    arr_tags = []
    #    self.tags.scan{ |t| arr_tags << self.tags  }
    #    Blog.public.find(:all,:conditions)
  end

  def previous_b
    Blog.public.first(:conditions=>['id < ?',self.id],:order=>'id desc')
  end

  def next_b
    Blog.public.first(:conditions=>['id > ?',self.id],:order=>'id asc')
  end

  def self.privates
    {0=>'公开',1=>'私有'}
  end

  def self.count_months
    Blog.public.count(:all,:group => "DATE_FORMAT(created_at,'%Y-%m')")
  end

end
