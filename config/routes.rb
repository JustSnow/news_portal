NewsPortal::Application.routes.draw do
  devise_for :users

  mount RedactorRails::Engine => '/redactor_rails'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "welcome#index"
  get 'tags/:tag', to: 'welcome#index', as: :tag

  resources :posts
end
