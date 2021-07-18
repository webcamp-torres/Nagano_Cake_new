class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :members, through: :cart_items

  has_many :order_items, dependent: :destroy

  belongs_to :genre
  attachment :image
  validates :genre_id, presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      Item.where(title: content)
    elsif method == 'forward'
      Item.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Item.where('title LIKE ?', '%'+content)
    else
      Item.where('title LIKE ?', '%'+content+'%')
    end
  end
end
