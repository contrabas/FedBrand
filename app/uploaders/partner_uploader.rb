# encoding: utf-8

class PartnerUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [250, 90]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end