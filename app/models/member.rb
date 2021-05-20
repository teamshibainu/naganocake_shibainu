class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_product, dependent: :destroy
  has_many :orders
  has_many :received, dependent: :destroy

  def active_for_authenticcation?
    super && (self.withdrawal_flag == false)
  end
end
