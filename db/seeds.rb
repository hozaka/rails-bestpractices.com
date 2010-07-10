Post.destroy_all
User.destroy_all

users = User.create([
  {:login => 'flyerhzm', :email => 'flyerhzm@gmail.com', :url => 'http://www.huangzhimin.com', :password => 'flyerhzm', :password_confirmation => 'flyerhzm'},
  {:login => 'richard', :email => 'richard@ekohe.com', :password => 'richard', :password_confirmation => 'richard'}
])

(1..10).each do |i|
  Post.create([
    {:title => "test #{i}a", :body => "subject#{i}\n========\ntitle#{i}\n------\n    def test\n      puts 'test'\n    end", :user => User.first},
    {:title => "test #{i}b", :body => "subject#{i}\n========\ntitle#{i}\n------\n    def test\n      puts 'test'\n    end", :user => User.last}
  ])
end
