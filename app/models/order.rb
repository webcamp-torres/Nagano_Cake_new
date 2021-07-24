class Order < ApplicationRecord
  belongs_to :member
  has_many :order_items, dependent: :destroy

  enum payment_method: {クレジットカード:0, 銀行振込:1}

  def all_total_payment #selfは@cart_itemsをさす
		@order_items.sum { |order| order_items.total_payment }
	end

	enum order_status: {
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送待ち: 3,
    発送済み: 4
  }
end
