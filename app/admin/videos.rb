#coding: utf-8
ActiveAdmin.register Video do
  form do |f|
    f.inputs do
      f.input :title
      f.input :thumb, hint: f.object.thumb.url ? 
        f.template.image_tag(f.object.thumb) :
        f.template.content_tag(:span, "")
      f.input :remote_thumb_url
      f.input :tag
    end

    f.actions
  end

  index do
    column :id
    column :title
    column "Thumb" do |video|
      link_to image_tag(video.thumb), video.thumb.url, target: '_blank'
    end
    column :tag
    
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
        format.html { redirect_to admin_videos_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_videos_url }
      end
    end
  end
end