class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :shipping_charge, :shipping_origin, :days_until_shipping

  validates :name, :explanation, :category_id, :status_id, :shipping_charge_id, :shipping_origin_id, :days_until_shipping_id, presence: true
  with_options presence: true, format: { with: [3-9][0-9]{2}|[1-9][0-9]{3,6}, message: 'Price Out of setting rangre' } do
    validates :price
  end
end
