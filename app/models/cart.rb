class Cart < ApplicationRecord
  belongs_to :user
  has_many :baskets
  has_many :products, through: :baskets

  def check_product_quantity
    self.baskets.each do |basket|
      if basket.product.quantity < basket.quantity
        basket.update(quantity: 0)
      end
    end
  end

end
