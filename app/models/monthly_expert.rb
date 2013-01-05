class MonthlyExpert < ActiveRecord::Base
  attr_accessible :expert_id, :month_id

  belongs_to :expert
  belongs_to :month
end
