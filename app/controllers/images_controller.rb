class ImagesController < ApplicationController
  before_filter :find_user
  def new
    @image = Image.new

    respond_to do |format|
      format.html {render :layout=>false}# new.html.erb
      format.xml  { render :xml => @image }
    end
  end
  protected
  def find_user
    unless logged_in?
      redirect_to blogs_path
    end
  end
end
