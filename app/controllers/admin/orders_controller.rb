class Admin::OrdersController < ApplicationController
before_action :authenticate_admin!

  def show
    @orders = Order.find(params[:id])
    @orders
  end
end
