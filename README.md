# DB 設計

## users table

| Column                | Type                | Options                   |
|-----------------------|---------------------|---------------------------|
| nickname              | string              | null: false               |
| email                 | string              | null: false, unique: true |
| encrypted_password    | string              | null: false               |
| family_name           | integer             | null: false               |
| first_name            | integer             | null: false               |
| read__family          | integer             | null: false               |
| read_first            | integer             | null: false               |
| birthday              | date                | null: false               |

### Association

* has_many :items
* has_many :buyers

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| explanation                         | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| condition_id                        | integer    | null: false                    |
| shipping_price_id                   | integer    | null: false                    |
| region_of_origin_id                 | integer    | null: false, foreign_key: true |
| shipment_days_id                    | integer    | null: false, foreign_key: true |
| price                               | integer    | null: false, foreign_key: true |
| user                                | reference  | null: false, foreign_key: true |


### Association

- belongs_to :user
* has_one :buyer
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_price
- belongs_to_active_hash :region_of_origin
- belongs_to_active_hash :shipment_days


## buyers table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_code        | string     | null: false                    |
| prefecture       | integer    | null: false, foreign_key: true |
| city             | string     | null: false                    |
| street           | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| item             | integer    | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item 
* has_many :historys
- belongs_to_active_hash :prefecture


## historys table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| user             | integer    | null: false, foreign_key: true |
| item             | integer    | null: false, foreign_key: true |
| buy_date         | date       | null: false, foreign_key: true |


### Association

- belongs_to :buyer
* has_one :user