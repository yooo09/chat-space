class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      #テーブル間でアソシエーションをつなぐときに、所属するテーブルのidを保存するカラムを作成する際には、reference型でカラムを作成
      #foreign_key	参照先を参照する外部キーの名前を指定できる（デフォルトは、参照先のモデル名_id）
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
