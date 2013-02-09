#coding: utf-8
ActiveAdmin.register Category do
  config.sort_order = "edited_time_desc"

  form do |f|
    f.inputs do
      f.input :name_ru
      f.input :name_en
      f.input :edited_time, as: :just_datetime_picker
    end

    f.actions
  end

  index do
    selectable_column
    column :id
    column :name_ru
    column :name_en
    column :edited_time

    default_actions
  end

  action_item except: [:show] do
    if I18n.locale == :en
      link_to "Rus version", locale: nil
    else
      link_to "Англ версия", locale: 'en'
    end
  end

  controller do
    defaults finder: :find_by_slug

    def create
      create! do |format|
        format.html { redirect_to admin_categories_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_categories_url }
      end
    end
  end
end
