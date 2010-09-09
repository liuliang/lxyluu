class BlogsController < ApplicationController
  uses_tiny_mce(:options=>{
    :theme => 'advanced',
    :theme_advanced_toolbar_location => 'top',
    :theme_advanced_buttons3_add=>'search,syntaxhl,rcode',
    :verify_html => false,
    :file_browser_callback => 'wfb'
    })
  
#  before_filter :find_user,:only=>[:new,:create,:edit,:update,:destroy,:my]
  # GET /blogs
  # GET /blogs.xml
  def index
    @blogs = Blog.public.paginate :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @blog = Blog.find(params[:id])
    @blog.update_attribute('view', @blog.view+1) unless @blog.blank?
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.xml
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html {render :layout=>true}# new.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  # POST /blogs.xml
  def create
    @blog = Blog.new(params[:blog])
    @blog.user_id = 1
#    render :text=>params[:blog][:content]
    
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

  # PUT /blogs/1
  # PUT /blogs/1.xml
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

  # DELETE /blogs/1
  # DELETE /blogs/1.xml
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

  protected

  def find_user
    unless logged_in?
      redirect_to blogs_path
    end
  end

end
