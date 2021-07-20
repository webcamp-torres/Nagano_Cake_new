class Admin::ItemsController < ApplicationController
   before_action :authenticate_member!

   def index
      @items = Item.all
      @items = Item.page(params[:page]).per(10)
      @genres = Genre.all
   end

   def new
      @item = Item.new
      @genres = Genre.all
   end

   def create
      @item = Item.new(item_params)
      @item.save
      redirect_to admin_item_path
   end

  

   def show
      @item = Item.find(params[:id])
      @genre = Genre.all
   end

   def update
   end

   def edit
   end

   private

   def item_params
      params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :sales_status, :item_id)

   end

end
