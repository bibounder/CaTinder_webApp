class CatLike < ActiveRecord::Base
  belongs_to :cat
  belongs_to :user

  rails_admin do
    visible false # hide model from listing
  end
end
