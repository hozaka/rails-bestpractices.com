require 'spec_helper'

describe User do
  should_have_many :posts
  
  it "should succeed creating a new :valid_user from the Factory" do
    Factory.create(:user_flyerhzm)
  end
    
  it "should invalid :invalid_user factory" do
    Factory.build(:invalid_user).should be_invalid
  end
end
