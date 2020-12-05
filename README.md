# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| name               | string              | null: false             |
| nick_name          | string              |                         |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| birth_day          | integer             | null: false             |
| phone_number       | integer             | null: false             |

### Associatiln

* has_many :item
* has_many :purchase
* has_one  :address



## items

| Column              | Type                | Options                 |
|---------------------|---------------------|-------------------------|
| item_name_id        | integer             | null: false             |
| category_id         | integer             | null: false             |
| condition-id        | integer             | null: false             |
| item_description    | string              | null: false             |
| price               | integer             | null: false             |
| delivery_date       | string              | null: false             |
| delivery_fee        | string              | null: false             |
| delivery_prefecture | string              | null: false             |
| delivery_guide      | string              | null: false             |
| user_id             | integer             | foreign_key: true       |

### Association

* belongs_to :user
* has_one    :purchase



## addresses

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| purchase_id        | integer             | foreign_key: true       |
| post_code          | integer             | null: false             |
| phone_number       | integer             | null: false             |
| prefecture         | string              | null: false             |
| municipalitie      | string              | null: false             |
| address_number     | string              | null: false             |
| building           | string              | null: false             |

### Association

* belongs_to :item
* belongs_to :purchase



## purchase

| Column             | Type                 | Options                       |
|--------------------|----------------------|-------------------------------|
| user_id            | integer              | foreign_key: true             |
| item_id            | integer              | foreign_key: true             |

### Association

* belongs_to :user
* belongs_to :item
* has_one    :address

