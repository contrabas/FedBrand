class Date
  def month_span
    at_beginning_of_month..at_end_of_month
  end

  def month_path
    { year: year, month: strftime('%B').downcase }
  end

  def month_i18n
    format = year == Date.today.year ? '%B' : '%B %Y'
    I18n.l(self, format: format).mb_chars.upcase.to_s
  end
end