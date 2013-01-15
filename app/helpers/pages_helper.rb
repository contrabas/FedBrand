module PagesHelper
  def ratings_row(i, name, rating)
    content_tag(:li) do
      content_tag(:em, "#{i}. #{name}") +
      content_tag(:span, rating)
    end
  end
end
