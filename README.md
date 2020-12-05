# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| name               | string              | null: false             |
| birth_day          | string              | null: false             |

### Associatiln

* has_many :items
* has_many :purchase
* has_one  :addresses


## items

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| item_name          | string              | null: false             |
| category           | string              | null: false             |
| condition          | string              | null: false             |
| delivery_date      | text                | null: false             |
| user_id            | string              | foreign_key: true       |
| address_id         | string              | foreign_key: true       |

### Association

- belongs_to :users
* has_one    :addresses
* has_one    :purchase




## addresses

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user_id            | string              | foreign_key: true       |
| post_code          | string              | null: false             |
| phone_number       | integer             | null: false             |
| prefecture         | string              | null: false             |
| municipalitie      | string              | null: false             |
| address_number     | string              | null: false             |
| building           | string              | null: false             |

### Association

* belongs_to :users
* belongs_to :addresses
* has_one    :purchase




## purchase

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user_id            | string              | null: false             |
| address_id         | string              | null: false             |
| item_id            | string              | null: false             |

### Association

* belongs_to :users
* belongs_to :items
* belongs_to :addresses

