class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # before_save { username.downcase! }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, length: { maximum: 50 },
              uniqueness: { case_sensitive: false }
  has_many :products, dependent: :delete_all
  has_one :cart, dependent: :delete

  def create_cart
    Cart.create(user: self) if !self.cart.present?
  end

end
