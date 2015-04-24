class CatImage < ActiveRecord::Base
  belongs_to :cat, inverse_of: :cat_images
  mount_uploader :path, CatImageUploader
  validates_presence_of :path

  rails_admin do
    visible false # hide model from listing

    field :path
  end
end
