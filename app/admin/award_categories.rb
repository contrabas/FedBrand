#coding: utf-8
ActiveAdmin.register AwardCategory do
  action_item except: [:show] do
    if I18n.locale == :en
      link_to "Rus version", locale: nil
    else
      link_to "Англ версия", locale: 'en'
    end
  end
  
  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_award_categories_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_award_categories_url }
      end
    end
  end
end