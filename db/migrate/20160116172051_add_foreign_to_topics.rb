class AddForeignToTopics < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :forum_id, :integer
  end
end
