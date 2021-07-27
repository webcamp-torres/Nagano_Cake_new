class Member < ApplicationRecord
   has_many :cart_items, dependent: :destroy
   has_many :deliveries, dependent: :destroy
   has_many :orders, dependent: :destroy
   validates :password, length: { minimum:6}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    self.last_name + " " + self.first_name
  end
  def active_for_authentication?
    super && (self.unsubscribe_status == false)
  end

end