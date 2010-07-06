class Post < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :title, :body
  
  before_create :generate_formatted_html
  
  attr_accessor :body_format
  
  FORMATTER = {'textile' => RedCloth, 'markdown' => RDiscount}
  
  private
    def generate_formatted_html
      self.formatted_html = FORMATTER[body_format].new(body).to_html
    end
end
