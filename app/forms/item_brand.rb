class ItemBrand

  include ActiveModel::Model

  attr_accessor :name, :explanation, :category_id, :status_id, :shipping_charge_id, :shipping_origin_id, :days_until_shipping_id, :price, :user_id, :image, :brand_id, :b_name
  
  # itemのバリデーション
  validates :name, :explanation, :category_id, :status_id, :shipping_charge_id, :shipping_origin_id, :days_until_shipping_id, presence: true
  with_options presence: true, format: { with: /[3-9][0-9]{2}|[1-9][0-9]{3,6}/, message: 'Price Out of setting rangre' } do
    validates :price
  end

  validates :image, presence: { message: 'ファイルを添付してください'}

  validates :category_id, :status_id, :shipping_charge_id, :shipping_origin_id, :days_until_shipping_id, numericality: { other_than: 1 }

  # brandのバリデーション
  with_options format: { with: /\A([ァ-ン]|ー)+\z/, message: '全角カタカナを使用してください' } do
    validates :b_name
  end
  validates :b_name, presence: true

  def save
    brand = Brand.where(b_name: b_name).first_or_initialize
    brand.save
    Item.create(name: name, explanation: explanation, category_id: category_id, status_id: status_id, shipping_charge_id: shipping_charge_id, shipping_origin_id: shipping_origin_id, days_until_shipping_id: days_until_shipping_id, price: price, user_id: user_id, brand_id: brand.id, image: image)
  end

end