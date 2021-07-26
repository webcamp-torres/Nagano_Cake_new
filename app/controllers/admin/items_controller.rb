class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!


   def index
      @items = Item.page(params[:page]).per(9)
      @genres = Genre.all
   end

   def new
      @item = Item.new
      @genres = Genre.all
   end

   def create
      @item = Item.new(item_params)
      @item.save
      redirect_to admin_item_path(@item)
   end

   def show
      @item = Item.find(params[:id])
      @genre = Genre.all
   end

   def update
      @item = Item.find(params[:id])
      @item.update(item_params)
      redirect_to admin_item_path
   end

   def edit
      @item = Item.find(params[:id])
      @genre_edit = Genre.all
   end

   private

   def item_params
      params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :sales_status, :item_id)
   end

end
