module UsersHelper

  def show_remove_or_add(product)
    if user_signed_in?
      if product.user == current_user
        content_tag :span, class: "remove-item" do
          link_to ' | Remove item', product_path(product), method: :delete,
            data: { confirm: 'This item will be removed from your shop. Are you sure?' }
        end
      else
        link_to ' | Add to cart', baskets_path(product_id: product.id,
          cart_id: current_user.cart.id, quantity: 0), method: :post
      end
    end
  end

end
