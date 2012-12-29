class Rating < ActiveRecord::Base
  attr_accessible :date, :region_id, :value

  belongs_to :region

  default_scope { 
    joins(region: :translations).where(region_translations: {locale: I18n.locale})
  }

  validates_presence_of :region, :value, :date

  after_initialize :set_default_date

  protected

  def set_default_date
    self.date = Date.today if self.date.blank?
  end
end
