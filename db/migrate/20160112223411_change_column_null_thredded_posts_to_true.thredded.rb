# This migration comes from thredded (originally 20140508024134)
class ChangeColumnNullThreddedPostsToTrue < ActiveRecord::Migration
  def change
    change_column_null :thredded_posts, :topic_id, true
  end
end
