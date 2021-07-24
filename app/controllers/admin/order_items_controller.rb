class Admin::OrderItemsController < ApplicationController

  def update
    order_item = OrderItem.find(params[:order_item][:order_id])
	  order_item.update(making_status: params[:order_item][:making_status].to_i)

		case order_item.making_status
		 when "製作中"
				order_item.order.update(order_status: "製作中")
		 when "製作完了"
		   if order_item.order.order_items.all?{|order_item| order_item.making_status == "製作完了"} #each文から取り出した全部が製作完了になったら
				order_item.order.update(order_status: "発送準備中")
		   end
			redirect_to admin_order_path(order_item.order.id)
     end
    end
end
