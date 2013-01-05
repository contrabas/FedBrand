class Nominee < ActiveRecord::Base
  attr_accessible :date, :description, :region_id, :award_id, :award_category_id,
    :winner, :title
  translates :description, :title

  belongs_to :region
  belongs_to :award
  belongs_to :award_category

  after_initialize :set_default_date

  private
  
  def set_default_date
    self.date = Date.today if self.date.blank?
  end
end
