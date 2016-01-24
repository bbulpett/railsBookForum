class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false, required: true, limit: 30000
      t.references :forum, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
