class User < ActiveRecord::Base
  include UuidIdentifiable

  has_many :cat_likes, dependent: :destroy
  has_many :cats, through: :cat_likes

  validates_uniqueness_of :email
  validates_presence_of :email, :name, :role
  validates_numericality_of :pet_number, greater_than_or_equal_to: 0

  ROLE_USER = 0
  ROLE_STAFF = 1
  ROLE_ADMIN = 2

  def admin?
    role == ROLE_ADMIN
  end

  def staff?
    role >= ROLE_STAFF
  end

  # @param [Cat] cat
  def cat_matches?(cat)
    return false if self.pet_number > 0 && !cat.sociable
    return false if cat.wants_outside && !self.has_exterior
    return true
  end

  has_secure_password

  rails_admin do
    field :email
    field :name
    field :password
    field :role, :enum do
      # noinspection RubyArgCount
      enum do
        {'Utilisateur' => ROLE_USER, 'Staff' => ROLE_STAFF, 'Admin' => ROLE_ADMIN}
      end

      default_value 'Utilisateur'
    end

    field :tw_user
    field :fb_user

    field :pet_number
    field :has_exterior
  end
end
