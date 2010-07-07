require 'spec_helper'

describe Post do
  before :each do
    Factory.create(:post)
  end
  
  should_belong_to :user
  should_validate_presence_of :title, :body
  should_validate_uniqueness_of :title
  
  describe "generated html" do
    it "generate textile html" do
      textile_post = Factory.create(:textile_post)
      textile_post.formatted_html.should == "<h1>subject</h1>\n<h2>title</h2>"
    end

    it "generate markdown html" do
      markdown_post = Factory.create(:markdown_post)
      markdown_post.formatted_html.should == "<h1>subject</h1>\n\n<h2>title</h2>\n"
    end
  end
end
