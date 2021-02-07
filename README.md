# テーブル設計

## users テーブル

| Column          | Type        | Options                   |
| --------------- | ----------- | ------------------------- |
| nickname        | string      | null: false               |
| email           | string      | null: false, unique: true |
| password        | string      | null: false               |
| last_name       | string      | null: false               |
| first_name      | string      | null: false               |
| last_name_kana  | string      | null: false               |
| first_name_kana | string      | null: false               |
| birth_year      |             |                           |
| birth_month     |             |                           |
| birth_day       |             |                           |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_image      |            | null: false                    |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category        |            |                                |
| status          |            |                                |
| shipping_cost   |            |                                |
| delivery_source |            |                                |
| shipping_day    |            |                                |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## destinations テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer    | null: false                    |
| prefecture      |            |                                |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_number | string     |                                |
| phone_number    | integer    | null: false                    |
| order_id        | references | null: false, foreign_key: true |

### Association

- has_many :orders

## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |

### Association
belongs_to :item
belongs_to :user
belongs_to :destination
