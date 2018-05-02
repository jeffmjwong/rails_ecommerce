module ApplicationHelper

  def username_link(user)
    link_to user.username, user_path(user)
  end

end
