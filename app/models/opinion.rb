class Opinion < ActiveRecord::Base
  attr_accessible :content, :expert_id
  translates :content

  belongs_to :expert
end
