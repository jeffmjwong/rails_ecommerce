class ChargesController < ApplicationController

  def one
    @product = Product.find(params[:product_id])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@product.unitprice * 100).to_i,
      :description => 'riverSite customer',
      :currency    => 'aud'
    )

    begin
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
    end

    UserMailer.send_seller_email_one_click_buy(@product.user, @product).deliver
    @product.update(quantity: (@product.quantity - 1))
  end

  def multiple
    @cart = Cart.find(params[:cart_id])
    @total_price = (params[:total_price].to_f * 100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @total_price,
      :description => 'riverSite customer',
      :currency    => 'aud'
    )

    begin
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
    end

    UserMailer.send_buyer_email_cart(@cart.user, @cart, params[:total_price]).deliver
    @cart.baskets.each do |basket|
      if basket.quantity > 0
        basket.product.update(quantity: (basket.product.quantity - basket.quantity))
        basket.destroy
      end
    end
  end

end
