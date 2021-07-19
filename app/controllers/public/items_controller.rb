class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
  end
end
