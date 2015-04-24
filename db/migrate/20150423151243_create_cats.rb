class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.references :race, index: true, foreign_key: true
      t.string :name
      t.boolean :appart
      t.integer :age
      t.string :color
      t.integer :gender
      t.text :description

      t.timestamps null: false
    end
  end
end
