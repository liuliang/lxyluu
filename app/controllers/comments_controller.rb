class CommentsController < ApplicationController
  before_filter :find_blog
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.blog_id = @blog.id
    
    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
      else
        flash[:error] = 'Comment was created fail.'
      end
      format.html { redirect_to(@blog) }
    end
  end

  protected

  def find_blog
    @blog = Blog.find_by_id(params[:blog_id])
    redirect_to "/" if @blog.blank?
  end
  
end
