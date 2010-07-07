require 'spec_helper'

describe "posts/show.html.haml" do
  before(:each) do
    view.stub(:current_user).and_return(Factory.build(:user_flyerhzm))
    @post = assign(:post, stub_model(Post,
      :title => "Title",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Title".to_s)
    rendered.should contain("MyText".to_s)
  end
end
