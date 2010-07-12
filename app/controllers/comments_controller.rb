class CommentsController < InheritedResources::Base
  actions :create
  belongs_to :post, :implementation, :polymorphic => true

  create! do |success, failure|
    success.html { redirect_to parent_url }
    failure.html { render 'posts/show' }
  end

  private
    def parent_url
      if params[:implementation_id]
        post_implementation_path(@implementation.post, @implementation)
      elsif params[:post_id]
        post_path(@post)
      end
    end
end
