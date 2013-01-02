module PagesHelper
  def ratings_row(i, name, rating)
    content_tag(:li) do
      content_tag(:span, "#{i}. ") +
      content_tag(:div, name, class: 'name') +
      content_tag(:span, rating)
    end
  end
end
