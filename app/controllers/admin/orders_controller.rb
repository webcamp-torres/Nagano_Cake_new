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
		if order.order_status == "入金確認"
			order_items.update_all(making_status: "製作待ち")
		end

		redirect_to admin_order_path(order.id)
  end

end