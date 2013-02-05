#coding: utf-8
ActiveAdmin.register News do
  form do |f|
    f.inputs do
      f.input :slug
      f.input :title
      f.input :content
      f.input :logo, hint: f.object.logo.url ?
        f.template.image_tag(f.object.logo.url(:thumb)) :
        f.template.content_tag(:span, "")
      f.input :remote_logo_url
      f.input :tag_list, hint: "Разделять запятыми"
      f.input :category
      f.input :announcement
      f.input :published_by
      f.input :publish_url
    end

    f.actions
  end

  index do
    selectable_column
    column :id
    column "Logo" do |news|
      link_to image_tag(news.logo.url(:thumb)), news.logo.url,
        target: '_blank' if news.logo.url
    end
    column :title
    column :tag_list
    column :category
    column :award
    column :announcement
    column :published_by
    column :online

    default_actions
  end

  show do |g|
    attributes_table do
      row :id
      row :slug do
        link_to g.slug, g
      end
      row :logo do
        link_to image_tag(g.logo.url(:thumb).to_s), g.logo.url,
          target: '_blank' if news.logo.url
      end
      row :title
      row :content
      row :category
      row :award
      row :announcement
      row :published_by
      row :publish_url
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
