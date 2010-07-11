class CommentsController < InheritedResources::Base
  actions :create
  belongs_to :post, :polymorphic => true

  create! do |success, failure|
    success.html { redirect_to post_path(parent) }
    failure.html { render 'posts/show' }
  end
end
