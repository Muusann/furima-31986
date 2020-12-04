# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| nickname           | string              |null: false
| profile            | text                | null: false             |
| occupation         | text                | null: false             |
| position           | text                | null: false             |

## items

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| item               | string              | null: false             |
| price              | integer             | null: false             |
| detail             | text                | null: false             |
| title              | text                | null: false             |
| image              | string               | null: false             |

## address

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user_id            | string              | null: false             |
| post_code          | string              | null: false             |
| prefecture         | test              | null: false               |
| municipalitie      | text                | null: false             |

## purchase

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user_id            | string              | null: false             |
| address_id         | string              | null: false             |
| item_id            | string              | null: false             |

