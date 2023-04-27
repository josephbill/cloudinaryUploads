class AvatarUploader < CarrierWave::Uploader::Base
# app/uploaders/avatar_uploader.rb
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave
  # Choose what kind of storage to use for this uploader:
  #storage :file
  # storage :fog# Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  # “uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}”
  # end
end
