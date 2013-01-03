module PagesHelper
  def ratings_row(i, name, rating)
    content_tag(:li) do
      content_tag(:div, "#{i}. ", class: 'index') +
      content_tag(:div, name, class: 'name') +
      content_tag(:span, rating)
    end
  end
end
