class TradesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index, :move_to_root, :move_to_top]
  before_action :move_to_top, only: [:index]

  def index
    @trade = TradeAddress.new
  end

  def create
    @trade = TradeAddress.new(trade_params_2)

    if @trade.valid? && trade_params[:token].present?
      pay_item
      @trade.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def trade_params
    params.permit(:token)
  end

  def trade_params_2
    params.require(:trade_address).permit(:postal_code, :shipping_origin_id, :city, :street_number, :room_number, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: trade_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path if current_user.email == @item.user.email
  end

  def move_to_top
    redirect_to root_path if @item.trade.present?
  end
end
