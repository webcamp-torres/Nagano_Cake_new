class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :members, through: :cart_items

  has_many :order_items, dependent: :destroy

  belongs_to :genre

  attachment :image
  validates :genre_id, presence: true

  

end
