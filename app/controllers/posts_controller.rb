class PostsController < InheritedResources::Base
  before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
  
  protected
    def begin_of_association_chain
      @current_user
    end
end
