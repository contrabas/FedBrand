class Month < ActiveRecord::Base
  attr_accessible :month, :monthly_experts_attributes

  has_many :monthly_experts
  has_many :experts, through: :monthly_experts
  accepts_nested_attributes_for :monthly_experts, allow_destroy: true

  after_initialize :set_default_date

  private

  def set_default_date
    self.month = Date.today.at_beginning_of_month if self.month.blank?
  end
end
