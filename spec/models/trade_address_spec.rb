require 'rails_helper'

RSpec.describe TradeAddress, type: :model do
  describe '商品購入' do
    before do

      #item生成時に紐付けられたuerが出品者
      @item = FactoryBot.create(:item)

      # @trade_address生成時のuserが購入者
      @trade_address = FactoryBot.build(:trade_address, item_id: @item.id)
    end

    it '全てのフォームが正しく入力されていれば保存できる' do
      expect(@trade_address).to be_valid
    end

    it 'postal_codeが空だと登録できない' do
      @trade_address.postal_code = nil
      @trade_address.valid?
      expect(@trade_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号はハイフンが含まれていないと登録できない' do
      @trade_address.postal_code = '1234567'
      @trade_address.valid?
      expect(@trade_address.errors.full_messages).to include("Postal code Include hyphen(-)")
    end

    it 'shipping_origin_idが空だと登録できない' do
      @trade_address.shipping_origin_id = nil
      @trade_address.valid?
      expect(@trade_address.errors.full_messages).to include("Shipping origin can't be blank")
    end

    it 'cityが空だと登録できない' do
      @trade_address.city = nil
      @trade_address.valid?
      expect(@trade_address.errors.full_messages).to include("City can't be blank")
    end

    it 'street_numberが空だと登録できない' do
      @trade_address.street_number = nil
      @trade_address.valid?
      expect(@trade_address.errors.full_messages).to include("Street number can't be blank")
    end

    it 'room_numberは空でも登録できる' do
      @trade_address.room_number = nil
      expect(@trade_address).to be_valid
    end

    it 'phone_numberが空だと登録できない' do
      @trade_address.phone_number = nil
      @trade_address.valid?
      expect(@trade_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号にはハイフンが不要で11桁以上だと登録できない' do
      @trade_address.phone_number = '090-1234-5678'
      @trade_address.valid?
      expect(@trade_address.errors.full_messages).to include("Phone number is out of setting range")
    end

    it 'user_idが存在しないと保存できない' do
      @trade_address.user_id = nil
      @trade_address.valid?
      expect(@trade_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが存在しないと保存できない' do
      @trade_address.item_id = nil
      @trade_address.valid?
      expect(@trade_address.errors.full_messages).to include("Item can't be blank")
    end

  end
end
