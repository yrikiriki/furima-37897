# テーブル設計

##  usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| nickname           | string  | null: false               |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_date         | integer | null: false               |



##  itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| item_name          | text       | null: false                    |
| category           | string     | null: false                    |
| shipping_fee       | integer    | null: false                    |
| item_prefecture    | string     | null: false                    |
| scheduled_delivery | integer    | null: false                    |
| price              | integer    | null: false                    |
| tax_price          | integer    | null: false                    |
| profit             | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |



#  addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| postal_code        | integer    | null: false                    |
| address            | string     | null: false                    |
| building           | string     | null: false                    |
| phone_number       | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |


#  recordsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |