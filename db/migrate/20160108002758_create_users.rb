class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username, null:false, index:true, required:true, limit:20
      t.boolean :admin, :boolean, default: false, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
