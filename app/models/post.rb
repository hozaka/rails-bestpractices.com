class Post < ActiveRecord::Base
  acts_as_taggable
  
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  
  before_save :generate_formatted_html
  
  default_scope order('created_at desc')
  with_exclusive_scope do
    scope :hot, order('vote_points desc').limit(20)
  end
  
  def self.per_page
    10
  end
  
  def belongs_to?(user)
    user && user_id == user.id
  end

  def vote(user)
    self.votes.where(:user_id => user.id).first
  end
  
  private
    def generate_formatted_html
      self.formatted_html = RDiscount.new(body).to_html
    end
end
