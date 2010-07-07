class Post < ActiveRecord::Base
  acts_as_taggable
  
  belongs_to :user
  
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  
  scope :recent, order('created_at desc')
  
  before_save :generate_formatted_html
  
  attr_accessor :body_format
  
  FORMATTER = {'textile' => RedCloth, 'markdown' => RDiscount}
  
  def belongs_to?(user)
    user_id == user.id
  end
  
  private
    def generate_formatted_html
      if FORMATTER[body_format]
        self.formatted_html = FORMATTER[body_format].new(body).to_html
      end
    end
end
