class Public::OrdersController < ApplicationController
  before_action :authenticate_member!

  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_path
  end

  def confirm
    @cart_items = current_member.cart_items
    @order = Order.new(order_params)
    @order.shipping_fee = 800
    @order.payment_method = params[:order][:payment_method]
    #case

    #when condition

    #end
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:member_id, :postal_code, :address, :name, :shipping_fee, :total_payment, :payment_method, :order_status)
  end

end
