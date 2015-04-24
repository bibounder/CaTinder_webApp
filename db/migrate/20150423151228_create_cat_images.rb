class CreateCatImages < ActiveRecord::Migration
  def change
    create_table :cat_images do |t|
      t.references :cat, index: true, foreign_key: true
      t.string :path

      t.timestamps null: false
    end
  end
end
