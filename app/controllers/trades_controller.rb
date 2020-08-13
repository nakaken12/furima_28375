class TradesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index, :move_to_root, :move_to_top]
  before_action :move_to_top, only: [:index]


  def index
    # @trade = TradeAddress.new
  end

  def create
    @trade = TradeAddress.new(trade_params_2)
    
    # status == 200 以外の時tokenは存在しない
    if trade_params[:token].present?
      if @trade.valid?
        pay_item
        @trade.save
        redirect_to root_path
      else
        render :index
      end
    else
      render :index
    end
    # status == 200 以外の時tokenは存在しない
  
  end

  private

  def trade_params
    params.permit(:token)
  end

  def trade_params_2
    params.permit(:postal_code, :shipping_origin_id, :city, :street_number, :room_number, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      
     amount: @item.price,
     card: trade_params[:token],
     currency:'jpy'
   )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    if current_user.email == @item.user.email
      redirect_to root_path
    end
  end

  def move_to_top
    if @item.trade.present?
      redirect_to root_path
    end
  end

end
