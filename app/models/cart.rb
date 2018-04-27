class Cart < ApplicationRecord
  belongs_to :user
  has_many :baskets
  has_many :products, through: :baskets
end
