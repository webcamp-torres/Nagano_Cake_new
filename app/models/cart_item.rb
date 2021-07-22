class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :member

  def total_price
		(self.item.price * amount*1.10).floor
	end

	def self.all_total_price #selfは@cart_itemsをさす
		self.sum { |cart_item| cart_item.total_price }
	end

end
