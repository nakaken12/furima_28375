class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :days_until_shipping

  validates :name, :explanation, :category_id, :status_id, :shipping_charge_id, :shipping_origin_id, :days_until_shipping_id, presence: true
  with_options presence: true, format: { with: /[3-9][0-9]{2}|[1-9][0-9]{3,6}/, message: 'Price Out of setting rangre' } do
    validates :price

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, numericality: { other_than: 1 } 
  end
end
