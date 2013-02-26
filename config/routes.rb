FedBrand::Application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    mount Ckeditor::Engine => '/ckeditor'
    ActiveAdmin.routes(self)
    devise_for :users, ActiveAdmin::Devise.config
    root to: 'pages#index'
    get "contacts" => "pages#contacts"

    resources :experts, only: %w(index show) do
      collection do
        get 'quotes'
        match '/:year/:month' => 'experts#monthly', as: :monthly
      end
    end
    resources :news, only: %w(index show) do
      collection do
        get 'tags/:tag', to: 'news#tags', as: :tag
        get 'category/:category', to: 'news#category', as: :category
      end
    end
    resources :videos, only: %w(show)
    resources :ratings, only: %w(index)
    resources :awards, only: %w(index) do
      collection do
        get "organizers"
        get "nominees"
        match 'archive(/:id)' => 'awards#archive', as: :archive
      end
    end
  end
end
