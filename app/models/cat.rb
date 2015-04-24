class Cat < ActiveRecord::Base
  belongs_to :race
  has_many :cat_images, inverse_of: :cat, dependent: :destroy
  accepts_nested_attributes_for :cat_images, allow_destroy: true
  validates_numericality_of :age, greater_than_or_equal_to: 0

  validates_presence_of :race, :name, :gender

  GENDER_MALE = 0
  GENDER_FEMALE = 1

  rails_admin do
    field :race
    field :name
    field :appart
    field :gender, :enum do
      # noinspection RubyArgCount
      enum do
        {'Male' => 0, 'Femelle' => 1}
      end

      default_value 'Male'
    end
    field :age
    field :color
    field :description
    field :cat_images
  end
end
