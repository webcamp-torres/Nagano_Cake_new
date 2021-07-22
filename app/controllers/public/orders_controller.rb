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

  def confirm #"確認画面へ進む"ボタンを押したときに呼ばれる
    @cart_items = current_member.cart_items
    @order = Order.new(order_params)
    @order.shipping_fee = 800
    @order.payment_method = params[:order][:payment_method]
    @address_option = params[:order][:address_option]

    if @address_option == "0" #選択したお届け先によってカラムに代入するものを変える
      @order.postal_code = current_member.postal_code
      @order.address = current_member.address
      @order.address_name = current_member.last_name + current_member.first_name
    elsif @address_option == "1"
      @delivery = Address.find(params[:order][:address])
      @order.postal_code = @delivery.postal_code
      @order.address = @delivery.address
      @order.address_name = @delivery.address_name
    elsif @address_option == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.address_name = params[:order][:name]
    end
  end

  def complete
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.save
    @cart_items = current_member.cart_items
  end

  private
  def order_params
    params.require(:order).permit(:member_id, :postal_code, :address, :name, :shipping_fee, :total_payment, :payment_method, :order_status)
  end

end
