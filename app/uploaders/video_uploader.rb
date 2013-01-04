# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file
  process resize_to_fit: [250, 200]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end