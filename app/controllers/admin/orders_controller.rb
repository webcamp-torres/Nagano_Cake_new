class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    order = Order.find(params[:id])
    status = params[:order][:order_status].to_i
    order.update(order_status: status)
    redirect_to admin_order_path(order)
  end

end