class User < ActiveRecord::Base
  acts_as_authentic
  is_gravtastic!
  
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :votes, :dependent => :destroy
end
