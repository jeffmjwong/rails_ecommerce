class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :baskets, dependent: :delete_all
end
