class Juror < ActiveRecord::Base
  attr_accessible :expert_id, :nomination_id

  belongs_to :expert
  belongs_to :nomination
end
