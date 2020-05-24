class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      #インデックスはテーブル内のデータ検索を高速化
      t.index :name, unique: true
      t.timestamps
    end
  end
end
