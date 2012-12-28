class Opinion < ActiveRecord::Base
  attr_accessible :content, :expert_id

  belongs_to :expert
end
