class User < ActiveRecord::Base
  acts_as_authentic
  model_stamper
end
