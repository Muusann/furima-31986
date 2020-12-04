# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| --------           | ------  | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |



## items テーブル

| Column     | Type    | Options                      |
| ---------- | ------- | ---------------------------- |
| title      | string  | null: false                  |
| price      | integer | null: false                  |
| user_id    | string  | null: false foreign_key: true|
| address_id | string  | null: false foreign_key: true|



## addresses テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| user_id          | string     | foreign_key: true |
| address_parchase | string     | foreign_key: true |
| phone_number     | integer    | null: false       |



## purchase テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | string     | foreign_key: true              |
| items_id | string     | null: false, foreign_key: true |
