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

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |


- has_many   :products 
- has_many   :records

## products テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| description        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| status_id          | integer    | null: false                   |
| cost_id            | integer    | null: false                   |
| prefecture_id      | integer    | null: false                   |
| days_id            | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false, foreign_key: true|

- belongs_to :user 
- has_one :record

## sends テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name	   | string     |                                |
| phone_number     | string     | null: false                    |
| record           | references | null: false, foreign_key: true |

- belongs_to :record

## records テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| product          | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :product
- has_one :send
