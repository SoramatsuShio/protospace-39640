class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :prototype  # prototypeテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
  


end
