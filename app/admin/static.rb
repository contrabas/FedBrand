#coding: utf-8
ActiveAdmin.register Static do
  form do |f|
    f.inputs do
      f.input :name, input_html: { disabled: true }
      f.input :content_ru, as: :ckeditor
      f.input :content_en, as: :ckeditor
    end

    f.actions
  end

  index do
    selectable_column
    column :id
    column :name
    column :content_ru do |static|
      truncate static.content_ru, length: 500, separator: ' '
    end
    column :content_en do |static|
      truncate static.content_en, length: 500, separator: ' '
    end

    default_actions
  end

  show do |g|
    attributes_table do
      row :id
      row :name
      row :content_ru
      row :content_en
      row :created_at
      row :updated_at
    end
  end

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
        format.html { redirect_to admin_statics_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_statics_url }
      end
    end
  end
end