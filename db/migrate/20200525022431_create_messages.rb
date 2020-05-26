class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.string :image
      #テーブルのidを保存するカラムを作成する際には、reference型でカラムを作成
      #referencesを使用するとインデックスの設定も自動的に行われ
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
