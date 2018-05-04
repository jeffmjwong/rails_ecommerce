class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true, length: { minimum: 3, maximum: 200 }
  belongs_to :user
  has_many :baskets, dependent: :delete_all
  has_many :reviews, dependent: :delete_all

  scope(:product_name, -> (prod_name) { where('LOWER(name) like ?', "%#{prod_name.downcase}%") })

  def avg_rating
    total_reviews = 0.0
    total_ratings = 0.0
    self.reviews.each do |review|
      total_reviews += 1
      total_ratings += review.rating
    end
    average_rating = total_ratings / total_reviews
    return average_rating
  end

end
