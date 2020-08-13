class TradeAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_origin_id, :city, :street_number, :room_number, :phone_number, :item_id, :user_id

  # shipping_addressのバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Include hyphen(-)"}
    validates :shipping_origin_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_number
    validates :phone_number, numericality: { greater_than_or_equal_to: 00000000000, less_than_or_equal_to: 99999999999, message: "is out of setting range"}
  end

  # 外部キーのバリデーション
  validates :item_id, :user_id, presence: true

  def save
    ShippingAddress.create(postal_code: postal_code, shipping_origin_id: shipping_origin_id, city: city, street_number: street_number, room_number: room_number, phone_number: phone_number, item_id: item_id)
    Trade.create(item_id: item_id, user_id: user_id)
  end

end