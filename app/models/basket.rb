class Basket < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def check_product_presence
    if !self.product.present?
      self.destroy
    end
  end
end
