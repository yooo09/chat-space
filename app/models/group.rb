class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  #バリデーション  データを登録する際に、一定の制約をかける
  validates :name, presence: true, uniqueness: true
end
