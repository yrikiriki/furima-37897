# テーブル設計

##  usersテーブル
has_many :items
has_many :records

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| nickname           | string  | null: false               |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_date         | date    | null: false               |



##  itemsテーブル
belongs_to :user
has_one :record

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | text       | null: false                    |
| category_id           | integer    | null: false                    |
| item_status_id        | integer    | null: false                    |
| shipping_fee_id       | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| scheduled_delivery_id | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |



#  addressesテーブル
belongs_to :user
belongs_to :record

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| prefecture_id      | string     | null: false                    |
| city               | string     | null: false                    |
| postal_code        | integer    | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| record             | references | null: false, foreign_key: true |


#  recordsテーブル
belongs_to :user
belongs_to :item
has_one :address

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |