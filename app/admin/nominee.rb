#coding: utf-8
ActiveAdmin.register Nominee do
  menu parent: "Awards"
  
  index do
    column :id
    column :title
    column :award
    column :award_category
    column :region
    column :date
    column :winner
    
    default_actions
  end

  show do |g|
    attributes_table do
      row :id
      row :title
      row :description
      row :award
      row :award_category
      row :region
      row :date
      row :winner
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
    def scoped_collection
      Nominee.unscoped
    end

    def resource
      Nominee.unscoped { super }
    end

    def create
      create! do |format|
        format.html { redirect_to admin_award_nominees_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_award_nominees_url }
      end
    end
  end
end