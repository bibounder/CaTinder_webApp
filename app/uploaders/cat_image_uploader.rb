class CatImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  process resize_to_fit: [285, 210]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
