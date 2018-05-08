class UserMailer < ApplicationMailer
  default :from => 'noreply@riversite.com'

  def send_signup_email(user)
    @user = user
    mail(:to => @user.email, :subject => 'Thanks for signing up')
  end

  def send_seller_email_one_click_buy(user, product)
    @user = user
    @product = product
    mail(:to => @user.email, :subject => 'A customer one-click bought your item')
  end

  def send_buyer_email_cart(user, cart, total_price)
    @user = user
    @cart = cart
    @total_price = total_price
    mail(:to => @user.email, :subject => 'Confirmation email for your purchases')
  end
end
