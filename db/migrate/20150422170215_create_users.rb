class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :token
      t.integer :role
      t.integer :tw_user
      t.integer :fb_user

      t.timestamps null: false
    end
  end
end
