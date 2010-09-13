xml.instruct! :xml, :version => "1.0"
xml.rss "version" => "2.0" do
  xml.channel do
    xml.title "lxyluu"
    xml.link root_url
    xml.description "lxyluu"
    @blogs.each do |blog|
      xml.item do
        xml.title blog.title
        xml.link blog_url(blog)
        xml.content blog.content
        xml.pubDate blog.created_at.to_s(:db)
      end
    end
  end
end