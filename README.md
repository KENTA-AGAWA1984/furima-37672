# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| password           | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |

### Association
* has_many :itemes
* has_many :orders
* has_one :addresses

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| introduction                        | text       | null: false                    |
| category                            | integer    | null: false                    |
| condition                           | integer    | null: false                    |
| postage_type                        | integer    | null: false                    |
| shipping area                       | integer    | null: false                    |
| preparation_days                    | integer    | null: false                    |
| price                               | integer    | null: false                    |
| user_id                             | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :orders

## orders table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| buyer_user_id | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items

## addresses table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| postal_code      | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| street           | string     | null: false                    |
| building         | strimg     | null: false                    |
| phone            | integer    | null: false                    |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :user

