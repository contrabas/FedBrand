class Rating < ActiveRecord::Base
  attr_accessible :date, :region_id, :value

  belongs_to :region

  default_scope { 
    joins(region: :translations)
      .where(region_translations: {locale: I18n.locale}).readonly(false)
  }

  scope :by_regions, lambda {|regions_id| 
    includes(:region).where(regions: {id: regions_id})
  }

  validates_presence_of :region, :value, :date

  after_initialize :set_default_date

  protected

  def set_default_date
    self.date = Date.today if self.date.blank?
  end
end
