class PostsController < InheritedResources::Base
  before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
  belongs_to :tag, :optional => true, :class_name => 'ActsAsTaggableOn::Tag'
  has_scope :hot
  respond_to :xml, :atom, :only => :index

  show! do |format|
    @post.increment!(:view_count)
  end
  
  def archive
    @posts = Post.all
  end
  
  protected
    def begin_of_association_chain
      @current_user
    end
    
    def collection
      @posts ||= end_of_association_chain.paginate(:page => params[:page])
    end
end
