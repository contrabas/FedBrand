module ApplicationHelper
  def title
    content_tag :title do
      @title || "Fed Brand"
    end
  end
end
