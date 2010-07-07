require 'spec_helper'

describe Post do
  before :each do
    Factory.create(:post)
  end
  
  should_belong_to :user
  should_validate_presence_of :title, :body
  should_validate_uniqueness_of :title
end
