class Rating < ActiveRecord::Base
  attr_accessible :date, :region_id, :value

  belongs_to :region

  scope :by_regions, lambda {|regions_id| 
    includes(:region).where(regions: {id: regions_id})
  }

  validates_presence_of :region, :value, :date

  after_initialize :set_default_date

  def self.top limit=nil
    sum 'value', include: :region, group: 'regions.id',
      order: 'SUM(value) DESC', limit: limit
  end

  def self.sum_by_region
    sum :value, include: :region, group: "regions.name_#{I18n.locale}"
  end

  def self.last_month
    order('date DESC').first.date.at_beginning_of_month
  end

  private

  def set_default_date
    self.date = Date.today.at_beginning_of_month if self.date.blank?
  end
end
