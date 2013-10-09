require 'sidekiq/web'

NewsPortal::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  mount RedactorRails::Engine => '/redactor_rails'
  mount Sidekiq::Web, at: "/sidekiq"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "welcome#index"
  get 'tags/:tag', to: 'welcome#index', as: :tag
  get '/search', to: 'welcome#index', as: :search
  get '/feed', to: 'posts#feed', as: :feed
  delete 'delete_comment/:id', to: 'posts#delete_comment', as: :delete_comment

  resources :posts do
    member do
      post 'comments'
      delete 'destroy_preview'
      get 'save_preview'
    end
    collection do
      get 'preview'
      post 'preview'
      put 'preview'
    end
  end
end
