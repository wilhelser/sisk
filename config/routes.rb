Sisk::Application.routes.draw do
  resources :benefits

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :sites

  get "home/index"
  devise_for :users
  root :to => "home#index"
end
