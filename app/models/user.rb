class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # before_save { username.downcase! }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, length: { maximum: 20 },
              uniqueness: { case_sensitive: false }
  has_many :products, dependent: :delete_all
  has_one :cart, dependent: :delete
  has_many :reviews, dependent: :delete_all
  after_create :send_welcome_email

  def create_cart_after_user_sign_up
    Cart.create(user: self) if !self.cart.present?
  end

  def send_welcome_email
    UserMailer.send_signup_email(self).deliver
  end

end
