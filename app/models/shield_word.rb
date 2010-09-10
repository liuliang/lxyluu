class ShieldWord < ActiveRecord::Base

  validates_presence_of :name

  def self.check_content(str)
    return nil if str.blank?
      ShieldWord.all.each do |sw|
      if "#{params[:comment][:content]}".index(sw.name)
        return sw.name
        break
      end
    end
  end

  def self.v_c(content=nil)
    retrun nil if content.blank?
    ShieldWord.all.each do |sw|
      content.gsub!(sw.name,'*'*sw.name.size)
    end
  end

end
