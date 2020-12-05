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
| birth_day          | datetime            | null: false             |

### Associatiln

* has_many :items
* has_many :purchase
* has_one  :address



## items

| Column                 | Type                | Options                        |
|------------------------|---------------------|--------------------------------|
| item_name              | string              | null: false                    |
| category_id            | integer             | null: false                    |
| condition_id           | integer             | null: false                    |
| item_description       | string              | null: false                    |
| price                  | integer             | null: false                    |
| delivery_date_id       | integer             | null: false                    |
| delivery_fee_id        | integer             | null: false                    |
| delivery_prefecture_id | integer             | null: false                    |
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
| delivery_prefecture_id | integer             | null: false                          |
| address_number         | string              | null: false                          |
| building               | string              |                                      |

### Association

* belongs_to :item



## purchase

| Column             | Type                 | Options                        |
|--------------------|----------------------|--------------------------------|
| user_id            | integer              | null: false, foreign_key: true |
| item_id            | integer              | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one    :address

