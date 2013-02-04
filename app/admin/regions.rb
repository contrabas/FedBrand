#coding: utf-8
ActiveAdmin.register Region do
  index do
    selectable_column
    column :id
    column :name_ru
    column :name_en
    column "Emblem" do |region|
      link_to image_tag(region.emblem.url(:icon)), region.emblem.url,
        target: '_blank' if region.emblem.url
    end
    default_actions
  end

  show do |r|
    attributes_table do
      row :id
      row :name_ru
      row :name_en
      row :emblem do
        link_to image_tag(r.emblem.url(:thumb)), r.emblem.url,
          target: '_blank' if region.emblem.url
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form multipart: true do |f|
    f.inputs do
      f.input :name_ru
      f.input :name_en

      f.input :emblem, hint: f.object.emblem.url ?
        f.template.image_tag(f.object.emblem.url(:thumb)) :
        f.template.content_tag(:span, "")
      f.input :remote_emblem_url
    end

    f.actions
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
        format.html { redirect_to admin_regions_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_regions_url }
      end
    end
  end
end
