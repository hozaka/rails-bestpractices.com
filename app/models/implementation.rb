class Implementation < ActiveRecord::Base
  include Markdownable

  belongs_to :user
  belongs_to :post
  has_many :comments, :as => :commentable, :dependent => :destroy
end
