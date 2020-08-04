# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| family_name_full_width | string | null: false |
| first_name_full_width  | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday | date | null: false |

### Association
- has_many :item_purchases
- has_many :items

## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| image    | string | null: false |
| name     | string | null: false |
| explanation  | text   | null: false |
| category_id  | integer | null: false |
| status_id    | integer | null: false |
| shipping_charges_id    | integer | null: false |
| shipping_origin_id     | integer | null: false |
| days_until_shipping_id | integer | null: false |
| price      | integer | null: false |
| user  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item_purchases
- has_one :shipping_address
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping_charges
- belongs_to_active_hash :shipping_origin
- belongs_to_active_hash :days_until_shipping

## shipping_address テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal_code   | string | null: false |
| prefecture_id | integer | null: false |
| city     | string  | null: false |
| street_number | string | null: false |
| room_number   | string |  
| phone_number  | string | null: false |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :items
- belongs_to_active_hash :prefecture

## item_purchases テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

