module ApplicationHelper

  def username_link(user)
    link_to user.username, user_path(user)
  end

  def product_price(product)
    sprintf('%.2f', product.unitprice)
  end

end
