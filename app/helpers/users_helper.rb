module UsersHelper
  def user_link(user)
    if user.url
      link_to user.login, user.url, :target => '_blank'
    else
      content_tag :span, user.login
    end
  end
end
