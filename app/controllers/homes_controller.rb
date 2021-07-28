class HomesController < ApplicationController
  def top
    @items = Item.all.order(created_at: :desc)
    @genres = Genre.all
    @genre = Genre.new
  end

  def about
  end
end
