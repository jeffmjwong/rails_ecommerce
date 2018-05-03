module LoginHelper

  def home_link
    content_tag :p do
      concat link_to 'riverSite', root_path
      concat content_tag :span, '.com', class: 'white'
    end
  end

  def signup_link
    content_tag :span, class: 'signup' do
      link_to 'Sign Up', new_registration_path(resource_name)
    end
  end

end
