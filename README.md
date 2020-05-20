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

## usersテーブル
|Column|Type|Options|
|:----:|:----:|:----:|
|name|string|null:false, add_index:true|
|email|string|null: false, unique: true|
|password|string|null: false|
|password confirmation|string|null: false|

has_many :groups_users
has_many :groups, through: groups_users
has_many :messages


## messagesテーブル
|Column|Type|Options|
|:----:|:----:|:----:|
|body|text|
|image|string|
|group_id|integer|null: false,foreign_key:true|
|user_id|integer|null: false, foreign_key: true|

belongs_to :group
belongs_to :user


## groupsテーブル
|Column|Type|Options|
|:----:|:----:|:----:|
|group_name|string|null: false, unique: true|

has_many :groups_users
has_many :users, through: groups_users
has_many :messages


## groups_usersテーブル
|Column|Type|Options|
|:----:|:----:|:----:|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

belongs_to :group
belongs_to :user