module CommentsHelper
  def comment_user_link(comment)
    if comment.user and comment.user.url
      link_to comment.user.login, comment.user.url, :target => '_blank'
    elsif comment.user
      comment.user.login
    else
      comment.username
    end
  end
end
