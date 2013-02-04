#coding: UTF-8
class Rating < ActiveRecord::Base
  attr_accessible :date, :region_id, :value

  belongs_to :region

  scope :by_regions, lambda {|regions_id|
    includes(:region).where(regions: {id: regions_id})
  }

  validates_presence_of :region, :value, :date

  after_initialize :set_default_date

  def self.top limit=nil
    where(date: last_month.month_span).order('value DESC').limit(limit)
  end

  def self.sum_by_region
    sum :value, include: :region, group: "regions.name_#{I18n.locale}"
  end

  def self.last_month
    order('date DESC').first.date.at_beginning_of_month
  end

  def self.last_month_ratings
    where(date: last_month.prev_month.month_span).order('value DESC')
  end

  def self.import(file, date)
    parsed_date = Date.parse(date.to_a.sort.collect{|c| c[1]}.join("-"))
    Month.find_or_create_by_month(parsed_date).update_attributes ratings: file
    spreadsheet = open_spreadsheet file

    (4..spreadsheet.last_row).each do |i|
      row = spreadsheet.row i
      region = Region.find_or_create_by_name_ru row[1]
      create! region_id: region.id, value: row[8], date: parsed_date
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Csv.new(file.path, nil, :ignore)
      when ".xls" then Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Excelx.new(file.path, nil, :ignore)
      else raise "Неизвестный тип файла: #{file.original_filename}"
    end
  end

  private

  def set_default_date
    self.date = Date.today.at_beginning_of_month if self.date.blank?
  end
end
