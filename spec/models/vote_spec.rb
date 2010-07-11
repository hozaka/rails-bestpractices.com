require 'spec_helper'

describe Vote do
  should_belong_to :user
  should_belong_to :post
end
