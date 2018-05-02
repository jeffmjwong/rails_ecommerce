module HomeHelper

  def display_signup_and_login
    if !user_signed_in?
      content_tag :div, class: "home-header-action-container" do
        concat link_to 'Sign up', new_user_registration_path, class: "home-header-signup"
        concat link_to 'Log in', new_user_session_path, class: "home-header-login"
      end
    end
  end

end
