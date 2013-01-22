#coding: utf-8
ActiveAdmin.register Partner do
  form do |f|
    f.inputs do
      f.input :logo, hint: f.object.logo.url ?
        f.template.image_tag(f.object.logo.url(:thumb)) :
        f.template.content_tag(:span, "")
      f.input :remote_logo_url
      f.input :url
      f.input :name
    end

    f.actions
  end

  index do
    selectable_column
    column :id
    column :name
    column "Logo" do |partner|
      link_to image_tag(partner.logo.url(:thumb)), partner.logo.url, target: '_blank'
    end
    column :url
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
        format.html { redirect_to admin_partners_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_partners_url }
      end
    end
  end
end
