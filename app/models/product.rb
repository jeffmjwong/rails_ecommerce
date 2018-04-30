class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true, length: { minimum: 3, maximum: 120 }
  belongs_to :user
  has_many :baskets, dependent: :delete_all
end
