class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ordrer_item, only: [:index, :create]
  before_action :move_to_items_index

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_order
      @order_destination.save
      redirect_to controller: :items, action: :index
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_ordrer_item
    @item = Item.find(params[:item_id])
  end

  def move_to_items_index
    if current_user == @item.user || @item.order.present?
      redirect_to controller: :items, action: :index 
    end
  end

  def pay_order
    Payjp.api_key = ENV['FURIMA_SECRET_KEY']
    Payjp::Charge.create(
      amount: set_ordrer_item[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'
    )
  end
end
