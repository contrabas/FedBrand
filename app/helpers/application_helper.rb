#coding: UTF-8
module ApplicationHelper
  def title
    content_tag :title do
      @title || t('pages.nav.title')
    end
  end

  def nav_link label, url
    method = '.sub(/^\/en/,"")[ %r"/[^/]*" ]'
    fullpath = request.fullpath

    class_name = 'active' if eval("fullpath#{method}") == eval("url#{method}")
    link_to label, url, class: class_name
  end
end
