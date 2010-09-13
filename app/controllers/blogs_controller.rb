class BlogsController < ApplicationController
  uses_tiny_mce(:options=>{
      :theme => 'advanced',
      :theme_advanced_toolbar_location => 'top',
      :theme_advanced_buttons3_add=>'search,syntaxhl,rcode',
      :verify_html => false,
      :file_browser_callback => 'wfb'
    })
  
  #  before_filter :find_user,:only=>[:new,:create,:edit,:update,:destroy,:my]

  def index
    @blogs = Blog.public.paginate :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
#      format.xml  { render :xml => @blogs }
      format.rss
    end
  end


  def show
    @blog = Blog.find(params[:id])
    @blog.update_attribute('view', @blog.view+1) unless @blog.blank?
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  def new
    @blog = Blog.new

    respond_to do |format|
      format.html {render :layout=>true}# new.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(params[:blog])
    @blog.user_id = 1
    
    respond_to do |format|
      if @blog.save
        flash[:notice] = 'Blog was successfully created.'
        format.html { redirect_to(@blog) }
        format.xml  { render :xml => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.user_id = current_user.id
    
    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        flash[:notice] = 'Blog was successfully updated.'
        format.html { redirect_to(@blog) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(blogs_url) }
      format.xml  { head :ok }
    end
  end

  def my
    @blogs = current_user.blogs.available.paginate :page => params[:page]   
  end

  def search
    search_blogs
  end

#  def check_content
##    v = ShieldWord.check_content(params[:comment][:content])
#    v = '11'
#    respond_to do |wants|
#      wants.js { render :text => "#{v}" }
#    end
#
#  end

  protected

  def find_user
    unless logged_in?
      redirect_to blogs_path
    end
  end

  def search_blogs
    conds = []
    conds_h = {}
    unless params[:keyword].blank?
      conds << "  title LIKE :keyword"
      conds_h[:keyword] = "%#{params[:keyword]}%"
    end
   
    unless params[:date].blank?
      conds << "DATE_FORMAT(created_at,'%%Y-%%m') = '#{params[:date]}'"
    end

    unless params[:bc].blank?
      conds << "  blog_category_id = :bc"
      conds_h[:bc] = "#{params[:bc]}"
    end
    
   unless params[:tag].blank?
      conds << "tags LIKE :t"
      conds_h[:t] = "%#{params[:tag]}%"
    end
    @blogs = Blog.public.paginate(:all,:conditions => [conds.join(' AND '), conds_h],:page => params[:page])
  end

end
