class Public::DeliveriesController < ApplicationController
  before_action :authenticate_member!
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.member_id = current_member.id
    if @delivery.save
      redirect_to deliveries_path, notice: "配送先を登録しました"
    else
      render :index
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
    if @delivery.member_id == current_member
      redirect_to deliveries_path
    else
      render :edit
    end
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path, notice: "配送先が更新されました"
    else
      render :edit
    end
  end

  def destroy
    delivery = Delivery.find(params[:id])
    if delivery.destroy
      redirect_to deliveries_path, notice: "配送先が削除されました"
    else
      render :index
    end
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name, :member_id)
  end

end

