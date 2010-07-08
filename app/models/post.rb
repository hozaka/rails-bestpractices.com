class Post < ActiveRecord::Base
  acts_as_taggable
  
  belongs_to :user
  
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  
  before_save :generate_formatted_html
  
  scope :recent, order('created_at desc')
  
  def self.per_page
    10
  end
  
  def belongs_to?(user)
    user && user_id == user.id
  end
  
  private
    def generate_formatted_html
      self.formatted_html = RDiscount.new(body).to_html
    end
end
