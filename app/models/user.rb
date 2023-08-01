class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # app/models/user.rb
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :name, presence: true
  validates :profile, presence: true, length: { maximum: 200 }
  validates :occupation, presence: true
  validates :position, presence: true
  has_many :prototypes
  has_many :comments  # commentsテーブルとのアソシエーション

end
