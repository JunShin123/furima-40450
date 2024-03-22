# DB 設計

## users table

| Column                | Type                | Options                   |
|-----------------------|---------------------|---------------------------|
| nickname              | string              | null: false               |
| email                 | string              | null: false, unique: true |
| encrypted_password    | string              | null: false               |
| family_name           | string              | null: false               |
| first_name            | string              | null: false               |
| read_family           | string              | null: false               |
| read_first            | string              | null: false               |
| birthday              | date                | null: false               |

### Association

* has_many :items
* has_many :historys

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| explanation                         | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| condition_id                        | integer    | null: false                    |
| shipping_price_id                   | integer    | null: false                    |
| region_of_origin_id                 | integer    | null: false                    |
| shipment_day_id                     | integer    | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
* has_one :history
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_price
- belongs_to_active_hash :region_of_origin
- belongs_to_active_hash :shipment_days


## buyers table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| street           | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| history          | integer    | null: false, foreign_key: true |


### Association

- belongs_to :history
- belongs_to_active_hash :prefecture


## historys table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |


### Association

* has_one :buyer
* belongs_to :user
- belongs_to :item
