class Nominee < ActiveRecord::Base
  attr_accessible :date, :description, :region_id, :nomination_id

  belongs_to :region
  belongs_to :nomination
end
