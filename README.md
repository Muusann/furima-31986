# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |



## items テーブル

| Column     | Type    | Options                      |
| ---------- | ------- | ---------------------------- |
| title      | string  | null: false                  |
| price      | integer | null: false                  |
| user_id    | string  | null: false foreign_key: true|
| kategorie  | string  | null: false                  |



## addresses テーブル

| Column           | Type             | Options           |
| ---------------- | ---------------- | ----------------- |
| purchase_id      | string           | foreign_key: true |
| phone_number     | integer          | null: false       |
| post_number      | integer          | null: false       |
| prefecture       | string           | null: false       |
| municipalities   | string           | null: false       |


## purchase テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | string     | foreign_key: true              |
| items_id   | string     | foreign_key: true              |
| address_id | string     | foreign_key: true              |


