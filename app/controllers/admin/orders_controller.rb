class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
		@order.update(order_status: params[:order][:order_status].to_i)
		if params[:order][:order_status].to_i == 1
		  @order.order_items.update_all(making_status: 1)
		elsif params[:order][:order_status].to_i == 4
		  @order.order_items.update_all(making_status: 3)
		end
		# case order.order_status
		# when "入金確認"
			 #order_items.update_all(making_status: "製作待ち")
		# when order.order_status == "発送済み"
		  # order_items.update_all(making_status: "製作完了")
		# end
		redirect_to admin_order_path(@order.id)
  end

end