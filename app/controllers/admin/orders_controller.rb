class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    order = Order.find(params[:id])
		order_items = order.order_items
		order.update(order_status: params[:order][:order_status].to_i)
		case order.order_status
		when "入金確認"
			 order_items.update_all(making_status: "製作待ち")
		when order.order_status == "発送済み"
		  order_items.update_all(making_status: "製作完了")
		end
		redirect_to admin_order_path(order.id)
  end

end