module NavbarHelper

  def show_shop(user)
    if user_signed_in?
      content_tag :p do
        concat " | "
        concat link_to 'Shop', user_shop_path(user)
        concat " | "
      end
    end
  end

  def show_cart(user)
    if user_signed_in?
      content_tag :p do
        concat " | "
        concat link_to 'Cart', cart_path(user.cart)
        concat " | "
      end
    end
  end

  def show_login_link(user)
    if user_signed_in?
      content_tag :p do
        concat " | "
        concat link_to user.username, user_path(user)
        concat " ("
        concat link_to 'Logout', destroy_user_session_path, method: :delete
        concat ")"
      end
    else
      content_tag :p do
        concat " | "
        concat content_tag(:span, link_to('Login', new_user_session_path), class: 'login')
        concat " - access shop & cart"
      end
    end
  end

end
