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
| birthday_id | integer | null: false |

### Association
- belongs_to_active_hash :birthday
- has_one :credit_card
- has_many :shipping_address
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
| users_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping_charges
- belongs_to_active_hash :shipping_origin
- belongs_to_active_hash :days_until_shipping

## credit_card テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| number   | integer | null: false |
| validated_date    | integer | null: false |
| code      | integer  | null: false |
| users_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :users

## shipping_address テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal_code   | integer | null: false |
| prefecture_id | integer | null: false |
| city     | string  | null: false |
| street_number | string | null: false |
| room_number   | integer |  
| phone_number  | string | null: false |
| users_id | references | null: false, foreign_key: true |

### Association
- belongs_to :users