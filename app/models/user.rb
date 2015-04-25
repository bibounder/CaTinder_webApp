class User < ActiveRecord::Base
  include UuidIdentifiable

  has_many :cat_likes, dependent: :destroy
  has_many :cats, through: :cat_likes

  validates_uniqueness_of :email
  validates_presence_of :email, :name, :role

  ROLE_USER = 0
  ROLE_STAFF = 1
  ROLE_ADMIN = 2

  def admin?
    role == ROLE_ADMIN
  end

  def staff?
    role >= ROLE_STAFF
  end

  def check_cat_exterior?
    # user has no preference: let's skip
    return false unless self.has_exterior.present || self.appart.present?
    # if we have an exterior, we don't care!
    return false if self.has_exterior.present? && self.has_exterior
    # if we have an appartment and no outside... :(
    return true if self.appart.present? && self.appart
    # it's 'k, we're safe, the cat will be happy!
    return false
  end

  def has_pets?
    self.pet_number > 0
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

    field :appart
    field :pet_number
    field :has_exterior
  end
end
