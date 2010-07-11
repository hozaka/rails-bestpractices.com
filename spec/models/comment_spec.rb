require 'spec_helper'

describe Comment do
  should_belong_to :commentable, :polymorphic => true
  should_belong_to :user

  should_validate_presence_of :body
  should_validate_presence_of :username
end
