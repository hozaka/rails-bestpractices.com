class VotesController < InheritedResources::Base
  actions :create, :destroy
  belongs_to :post

  def create
    @post = Post.find(params[:post_id])
    @vote = @post.votes.create(:user_id => current_user.id, :like => like_value)
    create! do |format|
      format.html { redirect_to post_path(@post) }
    end
  end

  destroy! do |format|
    format.html { redirect_to post_path(@post) }
  end

  private
    def like_value
      params[:like] == "true" ? true : false
    end
end
