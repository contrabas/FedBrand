#coding: utf-8
ActiveAdmin.register User do
  action_item do
    if I18n.locale == :en
      link_to "Rus version", locale: nil
    else
      link_to "Англ версия", locale: 'en'
    end
  end

  index do
    column :email
    column :current_sign_in_ip
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :admin
    default_actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
    end
    f.buttons
  end
end
