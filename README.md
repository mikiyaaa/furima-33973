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
| birth_id        | date        | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## destinations テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_number    | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :item
belongs_to :user
has_one :destination
