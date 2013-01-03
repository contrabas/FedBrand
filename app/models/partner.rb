class Partner < ActiveRecord::Base
  attr_accessible :logo, :url, :name, :remote_logo_url

  mount_uploader :logo, PartnerUploader

  has_many :experts
end
