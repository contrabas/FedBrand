class Month < ActiveRecord::Base
  attr_accessible :month, :monthly_experts_attributes, :ratings

  mount_uploader :ratings, RatingUploader

  has_many :monthly_experts
  has_many :experts, through: :monthly_experts
  accepts_nested_attributes_for :monthly_experts, allow_destroy: true

  validates_uniqueness_of :month
  after_initialize :set_default_date

  def self.month(date)
    find_by_month date.month_span
  end

  private

  def set_default_date
    self.month = Date.today.at_beginning_of_month if self.month.blank?
  rescue ActiveModel::MissingAttributeError
  end
end
