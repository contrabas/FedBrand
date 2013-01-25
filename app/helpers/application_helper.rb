module ApplicationHelper
  def title
    content_tag :title do
      @title || "Fed Brand"
    end
  end

  def nav_link label, url
    class_name = 'active' if request.fullpath[ %r"/[^/]*" ] == url[ %r"/[^/]*" ]
    link_to label, url, class: class_name
  end
end
