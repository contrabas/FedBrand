# encoding: utf-8

class ExpertUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [125, 175]
    process :black_and_white
  end

  def black_and_white
    manipulate! do |img|
      img = img.quantize(256, Magick::GRAYColorspace)
    end
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end