class HomesController < ApplicationController
  def top
    @items = Item.all
    @genres = Genre.all
    @genre = Genre.new
  end

  def about
  end
end
