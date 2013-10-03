NewsPortal::Application.routes.draw do
  devise_for :users

  mount RedactorRails::Engine => '/redactor_rails'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :posts
  root to: "welcome#index"

  namespace :admin do
    resources :posts, except: [:new, :create, :show] do
      get 'publish', on: :member
      get 'unpublish', on: :member
    end
  end
end
