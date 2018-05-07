class ChargesController < ApplicationController

  def new
  end

  def create
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

    @product.update(quantity: (@product.quantity - 1))

  end

end
