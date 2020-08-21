class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def lookfor_category
    @items = Item.where(category_id: params[:id]).includes(:user).order('created_at DESC')
  end

  def new
    @item = ItemBrand.new
  end

  def create
    @item = ItemBrand.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to items_path
    else
      render :show
    end
  end

  def search
    @items = Item.search(params[:keyword]).order('created_at DESC')
  end

  private

  def item_params
    params.require(:item_brand).permit(:name, :explanation, :category_id, :status_id, :shipping_charge_id, :shipping_origin_id, :days_until_shipping_id, :price, :image, :brand_id, :b_name).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
