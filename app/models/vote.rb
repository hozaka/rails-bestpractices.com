class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  after_create :update_create_vote
  before_destroy :update_destroy_vote

  private
    def update_create_vote
      if like?
        post.increment!(:vote_points)
      else
        post.decrement!(:vote_points)
      end
    end

    def update_destroy_vote
      if like?
        post.decrement!(:vote_points)
      else
        post.increment!(:vote_points)
      end
    end
end
