class Public::ItemsController < ApplicationController
  before_action :authenticate_member!,except: [:index, :sh]
  def index
    @items = Item.all
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id, :amount)
  end

end
