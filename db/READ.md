# テーブル設計 table :protospaces 

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| title              | string  | null: false |
| catch_copy         | text    | null: false |
| concept            | text    |             |
| user               |reference|             |


- has_many :users
- has_many :comments






# テーブル設計 table :user 

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string |             |
| profile            | text   |             |
| occupation         | text   |             |
| position           | text   |             |


- has_many :comments
- has_many :prototype




# テーブル設計 table :comments 

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| content            | text    | null: false |
| prototype          |reference| null: false, foregin_key |
| user               |reference| null: false, foregin_key |


  belongs_to :prototype
  belongs_to :user

