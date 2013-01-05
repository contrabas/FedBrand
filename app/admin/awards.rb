#coding: utf-8
ActiveAdmin.register Award do
  form do |f|
    f.inputs do
      f.input :year
      f.input :ended
    end

    f.has_many :jurors do |g|
      unless g.object.new_record?
        g.input :_destroy, as: :boolean, required: false, label: t('delete')
      end

      g.input :expert
    end

    f.has_many :nominees do |g|
      unless g.object.new_record?
        g.input :_destroy, as: :boolean, required: false, label: t('delete')
      end

      g.input :title
      g.input :description
      g.input :date
      g.input :region
      g.input :award_category
      g.input :winner
    end

    f.actions
  end

  index do
    column :id
    column :year
    column :ended
    column :jury_count do |g|
      "#{g.jurors.count}"
    end
    column :nominees_count do |g|
      "#{g.nominees.count}"
    end
    default_actions
  end

  show do |g|
    attributes_table do
      row :id
      row :year
      row :ended
      g.jurors.each do |juror|
        row :juror do
          link_to juror.expert.name, admin_expert_path(juror.expert)
        end
      end
      g.nominees.each do |nominee|
        row :nominee do
          link_to nominee.title, admin_nominee_path(nominee)
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
        format.html { redirect_to admin_awards_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_awards_url }
      end
    end
  end
end
