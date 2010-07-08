require 'spec_helper'

describe Post do
  before :each do
    @post = Factory.create(:post)
  end
  
  should_belong_to :user
  should_validate_presence_of :title, :body
  should_validate_uniqueness_of :title
  
  describe "generated formatted html" do
    it "generate markdown html" do
      @post.formatted_html.should == "<h1>subject</h1>\n\n<h2>title</h2>\n"
    end
    
    it "generate markdown html with <pre><code>" do
      @post = Factory.create(:code_post)
      @post.formatted_html.should == "<h1>subject</h1>\n\n<h2>title</h2>\n\n<pre><code>def test\n  puts 'test'\nend\n</code></pre>\n"
    end
  end
end
