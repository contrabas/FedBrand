#coding: utf-8
ActiveAdmin.register News do
  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :logo, hint: f.object.logo.url ? 
        f.template.image_tag(f.object.logo.url(:thumb)) :
        f.template.content_tag(:span, "")
      f.input :remote_logo_url
      f.input :region
      f.input :category
      f.input :preview
      f.input :published_by
      f.input :publish_url
    end

    f.actions
  end

  index do
    column :id
    column "Logo" do |news|
      link_to image_tag(news.logo.url(:thumb)), news.logo.url, target: '_blank'
    end
    column :title
    column :content do |news|
      truncate news.content, length: 350, separator: ' '
    end
    column :preview
    column :published_by
    column :publish_url
    
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
    def scoped_collection
      News.unscoped
    end

    def resource
      News.unscoped { super }
    end

    def create
      create! do |format|
        format.html { redirect_to admin_news_index_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_news_index_url }
      end
    end
  end
end
