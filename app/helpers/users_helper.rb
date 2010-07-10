module UsersHelper
  def user_link(user)
    if user.url
      link_to user.login, user.url
    else
      content_tag :span, user.login
    end
  end
end
