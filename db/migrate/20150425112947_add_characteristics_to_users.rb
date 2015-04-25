class AddCharacteristicsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :appart, :boolean
    add_column :users, :pet_number, :integer
    add_column :users, :has_exterior, :boolean

    add_column :cats, :sociable, :boolean
    add_column :cats, :wants_outside, :boolean
  end
end
