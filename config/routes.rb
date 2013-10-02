NewsPortal::Application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :posts
  root to: "posts#index"
end
