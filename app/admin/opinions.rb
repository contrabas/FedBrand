#coding: utf-8
ActiveAdmin.register Opinion do
  action_item do
    if I18n.locale == :en
      link_to "Rus version", locale: nil
    else
      link_to "Англ версия", locale: 'en'
    end
  end
  
  controller do
    def scoped_collection
      Opinion.with_translations I18n.locale
    end

    def create
      create! do |format|
        format.html { redirect_to admin_opinions_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_opinions_url }
      end
    end
  end
end
