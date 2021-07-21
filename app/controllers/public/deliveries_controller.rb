class Public::DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.member_id = current_member.id
    @delivery.save
    redirect_to deliveries_path
  end

  def edit
  end

  def update
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to deliveries_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name, :member_id)
  end

end

