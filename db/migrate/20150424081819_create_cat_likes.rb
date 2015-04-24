class CreateCatLikes < ActiveRecord::Migration
  def change
    create_table :cat_likes do |t|
      t.references :cat, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :like

      t.timestamps null: false
    end
  end
end
