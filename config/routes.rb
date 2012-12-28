FedBrand::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    ActiveAdmin.routes(self)
    devise_for :users, ActiveAdmin::Devise.config
    
    resource :rating
    root to: 'pages#index'
  end
end
