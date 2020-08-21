class ItemBrandsController < ApplicationController

  def lookfor_brand
    brand = Brand.where(b_name: params[:value])
    if brand.length == 0
      @items = []
    else
      @items = Item.where(brand_id: brand.first.id).includes(:user).order('created_at DESC')
    end
  end

end
