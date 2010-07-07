Factory.define :post do |p|
  p.title 'title'
  p.body 'body'
end

Factory.define :textile_post, :parent => :post do |p|
  p.title 'textile post'
  p.body_format 'textile'
  p.body "h1. subject\n\nh2. title"
end

Factory.define :markdown_post, :parent => :post do |p|
  p.title 'markdown post'
  p.body_format 'markdown'
  p.body "subject\n=======\ntitle\n-----"
end