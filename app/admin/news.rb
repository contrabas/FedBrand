#coding: utf-8
ActiveAdmin.register News do
  action_item do
    if I18n.locale == :en
      link_to "Rus version", locale: nil
    else
      link_to "Англ версия", locale: 'en'
    end
  end
  
  controller do
    def scoped_collection
      News.with_translations I18n.locale
    end

    def create
      create! do |format|
        format.html { redirect_to admin_news_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_news_url }
      end
    end
  end
end
