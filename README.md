# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :messages
- has_many :group_users
- has_many :groups, through:  :group_users

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :users_groups
- has_many :users, through:  :group_users
- has_many :messages


## messages テーブル 
|Column|Type|Options|
|------|----|-------|
|image|string||
|text|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :group

## group_users テーブル
|Column|Type|Options|
|------|----|-------|
|users_id|integer|null: false, foreign_key: true|
|groups_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## pict テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text||
|image|string||
### Association
- belongs_to :user

## tweets テーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|title|string|
### Association
- belongs_to :user



