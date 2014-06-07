Sisk::Application.routes.draw do
  resources :benefits

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :sites

  get "home/index"
  devise_for :users
  root :to => "home#index"
  get "sites/:site_id/savings", to: 'sites#savings'
  get "sites/:site_id/health", to: 'sites#health'
  get "sites/:site_id/insurance", to: 'sites#insurance'
  get "sites/:site_id/security", to: 'sites#security'
end
