class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null:false, index:true, required:true, limit:20
  end
end
