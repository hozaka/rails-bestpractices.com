require 'spec_helper'

describe Implementation do
  should_belong_to :user
  should_belong_to :post
end
