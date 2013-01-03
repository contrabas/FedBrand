# encoding: utf-8

class RegionUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :icon do
    process resize_to_fit: [24, 24]
  end
  version :thumb do
    process resize_to_fit: [160, 160]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
