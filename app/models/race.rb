class Race < ActiveRecord::Base
  has_many :cats, inverse_of: :race
  validates_presence_of :name

  rails_admin do
    field :name
  end
end
