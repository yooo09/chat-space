class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #バリデーションは空の文字列の場合にエラーが発生する
  validates :name, presence: true, uniqueness: true
  has_many :group_users
  has_many :groups, through: :group_users

end
