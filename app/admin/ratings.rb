#coding: utf-8
ActiveAdmin.register Rating do
  form do |f|
    f.inputs do
      f.input :value
      f.input :date, as: :date, include_blank: false, discard_day: true
      f.input :region, include_blank: false
    end

    f.actions
  end

  index do
    column :id
    column :region, sortable: "regions.name"
    column :value
    column :date, sortable: :date do |rating|
      l rating.date, format: '%B %Y'
    end

    default_actions
  end

  show do |r|
    attributes_table do
      row :id
      row :value
      row :date
      row :region
      row :created_at
      row :updated_at
    end
    active_admin_comments
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
        format.html { redirect_to admin_ratings_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_ratings_url }
      end
    end
  end
end
