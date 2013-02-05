#coding: utf-8
ActiveAdmin.register Gallery do
  menu parent: "Awards"

  action_item except: [:show] do
    if I18n.locale == :en
      link_to "Rus version", locale: nil
    else
      link_to "Англ версия", locale: 'en'
    end
  end

  index do
    selectable_column
    column :id
    column :award_year do |g|
      link_to g.award.year, admin_award_path(g.award)
    end
    column :image_count do |g|
      "#{g.images.count}"
    end
    default_actions
  end

  show do |g|
    attributes_table do
      row :id
      row :award do
        link_to g.award.year, admin_award_path(g.award)
      end
      g.images.each do |image|
        row :image do
          link_to image_tag(image.file.url(:thumb)), image.file.url,
            target: '_blank' if image.file.url
        end
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :award, collection: Hash[Award.all.map{|n| [n.year,n.id]}]
    end

    f.has_many :images, multipart: true do |g|
      unless g.object.new_record?
        g.input :_destroy, as: :boolean, required: false, label: t('delete')
      end

      g.input :file, hint: g.object.file.url ?
        g.template.image_tag(g.object.file.url(:thumb)) :
        g.template.content_tag(:span, "")
      g.input :remote_file_url

      g.input :title
      g.input :description
    end

    f.actions
  end

  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_galleries_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_galleries_url }
      end
    end
  end
end
