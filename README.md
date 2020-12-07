# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| nick_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name_f       | string              | null: false             |
| last_name_f        | string              | null: false             |
| birth_day          | date                | null: false             |

### Associatiln

* has_many :items
* has_many :purchases



## items

| Column                 | Type                | Options                        |
|------------------------|---------------------|--------------------------------|
| name                   | string              | null: false                    |
| category_id            | integer             | null: false                    |
| condition_id           | integer             | null: false                    |
| description            | text                | null: false                    |
| price                  | integer             | null: false                    |
| delivery_date_id       | integer             | null: false                    |
| delivery_fee_id        | integer             | null: false                    |
| prefecture_id          | integer             | null: false                    |
| user_id                | integer             | null: false, foreign_key: true |

### Association

* belongs_to :user
* has_one    :purchase



## addresses

| Column                 | Type                | Options                              |
|------------------------|---------------------|--------------------------------------|
| purchase_id            | integer             | null: false, foreign_key: true       |
| post_code              | string              | null: false                          |
| phone_number           | string              | null: false                          |
| prefecture_id          | integer             | null: false                          |
| address_number         | string              | null: false                          |
| building               | string              |                                      |
| municipalities         | string              | null: false                          |

### Association

* belongs_to :purchase



## purchases

| Column             | Type                 | Options                        |
|--------------------|----------------------|--------------------------------|
| user_id            | integer              | null: false, foreign_key: true |
| item_id            | integer              | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one    :address

