class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :trade
  has_one :shipping_address
  belongs_to :brand
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :days_until_shipping
  has_one_attached :image

  validates :name, :explanation, :category_id, :status_id, :shipping_charge_id, :shipping_origin_id, :days_until_shipping_id, presence: true
  with_options presence: true, format: { with: /[3-9][0-9]{2}|[1-9][0-9]{3,6}/, message: 'Price Out of setting rangre' } do
    validates :price
  end

  validates :image, presence: { message: 'ファイルを添付してください'}

  validates :category_id, :status_id, :shipping_charge_id, :shipping_origin_id, :days_until_shipping_id, numericality: { other_than: 1 }

  def self.search(search)
    if search
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
