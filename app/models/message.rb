class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  #validates :content, presence: trueは、contentカラムが空の場合は保存しない、というバリデーション
  #unless: :image?という条件を追加
  #unless: :image?はimageカラムが空だったらという意味
  validates :content, presence: true, unless: :image?
  #アップローダーへのマウントする記述
  mount_uploader :image, ImageUploader
end
