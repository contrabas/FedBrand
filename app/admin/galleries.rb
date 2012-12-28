#coding: utf-8
ActiveAdmin.register Gallery do
  action_item do
    if I18n.locale == :en
      link_to "Rus version", locale: nil
    else
      link_to "Англ версия", locale: 'en'
    end
  end
  
  index do
    column :id
    column "Nomination year" do |g|
      link_to g.nomination.year, admin_nomination_path(g.nomination)
    end
    column "Image count" do |g|
      "#{g.images.count}"
    end
    default_actions
  end

  show do |g|
    attributes_table do
      row :id
      row :nomination do
        link_to g.nomination.year, admin_nomination_path(g.nomination)
      end
      g.images.each do |image|
        row :image do
          link_to image_tag(image.file.url(:thumb)), image.file.url, target: '_blank'
        end
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :nomination, collection: Hash[Nomination.all.map{|n| [n.year,n.id]}]
    end

    f.has_many :images, multipart: true do |g|
      unless g.object.new_record?
        g.input :_destroy, as: :boolean, required: false, label: 'Delete?'
      end

      g.input :file, hint: g.object.file.url ? 
        g.template.image_tag(g.object.file.url(:thumb)) :
        g.template.content_tag(:span, "")

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
