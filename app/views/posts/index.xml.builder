xml.instruct!
xml.rss(:version => '2.0') do
  xml.channel do
    xml.title "rails-bestpractices.com"
    xml.link 'http://www.rails-bestpractices.com'
    xml.description 'Learn the best practices of rails app and share your rails best practices'
    xml.language 'en-us'

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.description
        xml.author post.user.login
        xml.pubDate post.created_at
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
