module ApplicationHelper

  def username_link(user)
    link_to user.username, user_path(user)
  end

  def product_photo_link(product)
    link_to image_tag(product.photo_url(:homepage)), product_path(product)
  end

  def product_quantity(product)

  end

  def product_price(product)
    sprintf('%.2f', product.unitprice)
  end

end
