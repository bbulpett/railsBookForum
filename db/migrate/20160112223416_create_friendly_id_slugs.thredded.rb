# This migration comes from thredded (originally 20140829155651)
class CreateFriendlyIdSlugs < ActiveRecord::Migration
  def up
    unless ActiveRecord::Base.connection.table_exists? 'friendly_id_slugs'
      create_table :friendly_id_slugs do |t|
        t.string   :slug,           :null => false
        t.integer  :sluggable_id,   :null => false
        t.string   :sluggable_type, :limit => 50
        t.string   :scope, :limit => (191 if connection.adapter_name.downcase =~ /mysql/)
        t.datetime :created_at
      end

      add_index :friendly_id_slugs, :sluggable_id
      add_index :friendly_id_slugs, [:slug, :sluggable_type]
      add_index :friendly_id_slugs, [:slug, :sluggable_type, :scope], :unique => true
      add_index :friendly_id_slugs, :sluggable_type
    end
  end
end
