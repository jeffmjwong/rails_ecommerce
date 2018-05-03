module ApplicationHelper

  def render_navbar
    unless ((params[:controller] == 'devise-registrations' && params[:action] == 'new') ||
            (params[:controller] == 'devise-sessions' && params[:action] == 'new') ||
            (params[:controller] == 'products' && params[:action] == 'home'))
      render 'layouts/navbar'
    end
  end

  def username_link(user)
    content_tag(:span, (link_to user.username, user_path(user)), class: "user-name")
  end

  def product_image_link(product)
    content_tag :div, class: "product-image-container" do
      link_to image_tag(product.photo_url(:homepage)), product_path(product)
    end
  end

  def product_quantity(product)
    if product.quantity > 0
      content_tag(:span, product.quantity, class: "product-quantity")
    else
      content_tag(:span, "Out of stock", class: "product-oos")
    end
  end

  def product_price(product)
    content_tag(:span, "$#{sprintf('%.2f', product.unitprice)}", class: "product-price")
  end

end
