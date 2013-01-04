FedBrand::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    ActiveAdmin.routes(self)
    devise_for :users, ActiveAdmin::Devise.config
    
    resources :news, only: %w(index show)
    resources :ratings, only: %w(index)
    resources :awards, only: %w(index) do
      collection do
        get "organizers"
        get "nominees"
        match 'archive(/:id)' => 'awards#show'
      end
    end
    root to: 'pages#index'

    get "contacts" => "pages#contacts"
  end
end
