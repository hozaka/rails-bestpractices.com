Factory.define :post do |p|
  p.title 'post'
  p.body "subject\n=======\ntitle\n-----"
end

Factory.define :code_post, :parent => :post do |p|
  p.title 'code post'
  p.body "subject\n=======\ntitle\n-----\n    def test\n      puts 'test'\n    end"
end