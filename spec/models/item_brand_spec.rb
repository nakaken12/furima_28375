require 'rails_helper'
describe Item do
  before do
    @user = FactoryBot.create(:user)
    @brand = Brand.where(b_name: "ナイキ").first_or_initialize
    @brand.save
    @item = FactoryBot.build(:item_brand, user_id: @user.id, brand_id: @brand.id)
    @item.image = fixture_file_upload('/test_image.png')

  end
  describe '商品出品' do
    context '商品出品が上手く行く時' do
      it 'image、name、explanation、category_id、status_id、shipping_charge_id、shipping_origin_id、days_until_shipping_id、price、b＿nameが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品が上手く行かない時' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image ファイルを添付してください')
      end

      it 'nameが空では出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'explanationが空では出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idが空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idが空では出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'shipping_charge_idが空では出品できない' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it 'shipping_origin_idが空では出品できない' do
        @item.shipping_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end

      it 'days_until_shipping_idが空では出品できない' do
        @item.days_until_shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が¥300~¥9,999,999でないと出品できない' do
        @item.price = '150'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Price Out of setting rangre")
      end

      it 'b_nameが空では出品できない' do
        @item.b_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("B name can't be blank")
      end

      it 'b_nameは全角カナ文字でなければ出品できない' do
        @item.b_name = 'NIKE'
        @item.valid?
        expect(@item.errors.full_messages).to include("B name 全角カタカナを使用してください")
      end
    end
  end
end
