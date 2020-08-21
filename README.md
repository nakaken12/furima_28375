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
- has_many :trades
- has_many :items

## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| explanation  | text   | null: false |
| category_id  | integer | null: false |
| status_id    | integer | null: false |
| shipping_charge_id    | integer | null: false |
| shipping_origin_id     | integer | null: false |
| days_until_shipping_id | integer | null: false |
| price      | integer | null: false |
| user  | references | null: false, foreign_key: true |
| brand | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :brand
- has_one :trade
- has_one :shipping_address
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping_charge
- belongs_to_active_hash :shipping_origin
- belongs_to_active_hash :days_until_shipping

## shipping_address テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal_code   | string | null: false |
| shipping_origin_id | integer | null: false |
| city     | string  | null: false |
| street_number | string | null: false |
| room_number   | string |  
| phone_number  | string | null: false |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to_active_hash :shipping_origin

## trade テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## brandテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| b_name | string | null: false |

### Association
- has_many :items
