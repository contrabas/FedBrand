class Juror < ActiveRecord::Base
  attr_accessible :expert_id, :award_id

  belongs_to :expert
  belongs_to :award
end
