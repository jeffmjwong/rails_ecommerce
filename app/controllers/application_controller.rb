class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :create_cart

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    def create_cart
      if user_signed_in? && !current_user.cart.present?
        Cart.create(user: current_user)
      end
    end
end
