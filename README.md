# DB 設計

## users table

| Column                | Type                | Options                   |
|-----------------------|---------------------|---------------------------|
| nickname              | string              | null: false               |
| email                 | string              | null: false, unique: true |
| encrypted_password    | string              | null: false               |
| password_confirmation | string              | null: false               |
| family_name           | text                | null: false               |
| first_name            | text                | null: false               |
| read__family          | text                | null: false               |
| read_first            | text                | null: false               |
| birthday              | date                | null: false               |

### Association

* has_many :items
* has_many :buyers
- belongs_to :history

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| photo                               | text       | null: false                    |
| name                                | string     | null: false                    |
| explanation                         | text       | null: false                    |
| category                            | integer    | null: false                    |
| condition                           | integer    | null: false                    |
| shipping_price                      | integer    | null: false                    |
| region_of_origin                    | integer    | null: false                    |
| shipment_days                       | integer    | null: false                    |
| price                               | integer    | null: false                    |
| user                                | reference  | null: false                    |


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
- belongs_to_active_hash :prefecture
* has_many :historys


## historys table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| user             | integer    | null: false, foreign_key: true |
| item             | integer    | null: false, foreign_key: true |
| buy_date         | date       | null: false, foreign_key: true |


### Association

- belongs_to :buyer
* has_one :user