class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :baskets
  has_many :carts, through: :baskets
end
