module ApplicationHelper
  def title
    content_tag :title do
      @title || "Fed Brand"
    end
  end

  def nav_link label, url
    method = '.sub(/^\/en/,"")[ %r"/[^/]*" ]'
    fullpath = request.fullpath

    class_name = 'active' if eval("fullpath#{method}") == eval("url#{method}")
    link_to label, url, class: class_name
  end
end
