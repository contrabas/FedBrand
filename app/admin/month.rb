#coding: utf-8
ActiveAdmin.register Month do
  form do |f|
    f.inputs do
      f.input :month, as: :date, include_blank: false, discard_day: true
    end

    f.has_many :monthly_experts do |g|
      unless g.object.new_record?
        g.input :_destroy, as: :boolean, required: false, label: t('delete')
      end

      g.input :expert
    end

    f.actions
  end

  index do
    selectable_column
    column :id
    column :month, sortable: :month do |g|
      l g.month, format: '%B %Y'
    end
    column :expert_count do |g|
      "#{g.experts.count}"
    end
    default_actions
  end

  show do |g|
    attributes_table do
      row :id
      row :month do |g|
        l g.month, format: '%B %Y'
      end
      g.experts.each do |expert|
        row :expert do
          link_to expert.name, admin_expert_path(expert)
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
    def create
      create! do |format|
        format.html { redirect_to admin_months_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_months_url }
      end
    end
  end
end