class MonthlyExpert < ActiveRecord::Base
  attr_accessible :expert_id, :month_id

  belongs_to :expert
  belongs_to :month

  validates_uniqueness_of :expert_id, scope: :month_id
end
