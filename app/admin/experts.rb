#coding: utf-8
ActiveAdmin.register Expert do
  form do |f|
    f.inputs do
      f.input :category
      f.input :partner
      f.input :name
      f.input :photo, hint: f.object.photo.url ? 
        f.template.image_tag(f.object.photo.url(:thumb)) :
        f.template.content_tag(:span, "")
      f.input :remote_photo_url
      f.input :description
      f.input :position
      f.input :post
      f.input :workplace
    end

    f.actions
  end

  index do
    column :id
    column :name
    column "Photo" do |expert|
      link_to image_tag(expert.photo.url(:thumb)), expert.photo.url, target: '_blank'
    end
    column :description
    column :position
    column :post
    column :workplace
    column :category
    column :partner
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
    def create
      create! do |format|
        format.html { redirect_to admin_experts_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_experts_url }
      end
    end
  end
end
