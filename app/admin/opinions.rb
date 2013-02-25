#coding: utf-8
ActiveAdmin.register Opinion do
  menu parent: "Experts"
  config.sort_order = "edited_time_desc"

  form do |f|
    f.inputs do
      f.input :content, as: :ckeditor
      f.input :expert
      f.input :edited_time, as: :just_datetime_picker
    end

    # f.has_many :news_opinions do |g|
    #   unless g.object.new_record?
    #     g.input :_destroy, as: :boolean, required: false, label: t('delete')
    #   end

    #   g.input :news
    # end

    f.actions
  end

  index do
    selectable_column
    column :id
    column :content
    column :expert
    column :edited_time
    # column :news do |g|
    #   g.news.map(&:title).join(', ')
    # end

    default_actions
  end

  show do |g|
    attributes_table do
      row :id
      row :content
      row :expert
      row :edited_time
      # g.news.each do |news|
      #   row :news do
      #     link_to news.title, admin_news_path(news)
      #   end
      # end
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
    def scoped_collection
      Opinion.unscoped
    end

    def resource
      Opinion.unscoped { super }
    end

    def create
      create! do |format|
        format.html { redirect_to admin_opinions_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_opinions_url }
      end
    end
  end
end
