#coding: utf-8
ActiveAdmin.register Expert do
  form do |f|
    f.inputs do
      f.input :last_name
      f.input :first_name
      f.input :middle_name
      f.input :photo, hint: f.object.photo.url ?
        f.template.image_tag(f.object.photo.url(:thumb)) :
        f.template.content_tag(:span, "")
      f.input :remote_photo_url
      f.input :description
      f.input :position
      f.input :post
      f.input :workplace
      f.input :category
      f.input :partner
    end

    f.actions
  end

  index do
    selectable_column
    column :full_name
    column :photo do |expert|
      link_to image_tag(expert.photo.url(:thumb)), expert.photo.url,
        target: '_blank' if expert.photo.url
    end
    column :description
    column :position
    column :post
    column :workplace
    column :category
    column :partner
    default_actions
  end

  show do |g|
    attributes_table do
      row :id
      row :last_name
      row :first_name
      row :middle_name
      row :photo do
        link_to image_tag(g.photo.url(:thumb).to_s), g.photo.url,
          target: '_blank' if g.photo.url
      end
      row :description
      row :position
      row :post
      row :workplace
      row :category
      row :partner
      g.opinions.each do |opinion|
        row :opinion do
          link_to raw(opinion.content), admin_opinion_path(opinion)
        end
      end
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
    defaults finder: :find_by_slug

    def scoped_collection
      Expert.unscoped
    end

    def resource
      Expert.unscoped { super }
    end

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
