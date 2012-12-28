class Partner < ActiveRecord::Base
  attr_accessible :expert_id, :logo, :url

  has_many :experts
end
