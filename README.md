# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## user テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |


- has_many :prototypes
- has_many :comments

## product テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| description        | text       | null: false                   |
| category_id        | text       | null: false, foreign_key: true|
| status             | references | null: false                   |
| cost               | text       | null: false                   |
| prefecture_id      | text       | null: false                   |
| days               | text       | null: false                   |
| price              | text       | null: false                   |
| judgment           | text       |                               |

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- has_many :images dependent: :destroy

## send テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | integer    | null: false, foreign_key: true |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kane  | string     | null: false                    |
| post_code        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name	   | string     |                                |
| phone_number     | string     |                                |

- belongs_to :user

## image テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | string     | null: false                    |
| product_id       | integer    | null: false, foreign_key: true |

- belongs_to :product

## category テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| ancesty          | integer    | null: false                    |

- has_many :product
