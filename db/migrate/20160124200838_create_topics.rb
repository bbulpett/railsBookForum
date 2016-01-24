class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :title, null:false, index:true, required:true, limit:150
      t.integer :last_poster_id, null:false, index:true
      t.datetime :last_post_at
      t.text :tags, array:true, default: []
      t.references :forum, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
