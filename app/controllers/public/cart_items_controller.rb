class Public::CartItemsController < ApplicationController
  before_action :authenticate_member!
  def index
    @cart_items = current_member.cart_items
    @item = Item.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.member_id = current_member.id
    @cart_item.save
    redirect_to cart_items_path(@cart_item.id)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_back(fallback_location: cart_items_path)
  end

  def all_destroy
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :member_id)
  end
end
