module Markdownable
  def self.included(base)
    base.class_eval do
      before_save :generate_formatted_html
    end
  end

  def generate_formatted_html
    self.formatted_html = RDiscount.new(body).to_html
  end
end
