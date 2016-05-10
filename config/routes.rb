Sisk::Application.routes.draw do

  resources :site_configs

  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions" }, :token_authentication_key => 'authentication_key'
  resources :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :custom_sites
  resources :sections
  resources :benefits
  resources :sites do
    member do
      get "usage", to: 'sites#usage'
      get "savings", to: 'sites#savings'
      get "about", to: 'sites#about'
      get "savings", to: 'sites#savings'
      get "health", to: 'sites#health'
      get "insurance", to: 'sites#insurance'
      get "security", to: 'sites#security'
      get "register", to: 'sites#register'
      post "pull_savings", to: 'sites#pull_savings'
      get "pull_print_coupon", to: 'sites#pull_print_coupon'
      get "login", to: 'sites#login'
    end
  end

  get "home/index"
  get "usage", :to => 'home#usage'
  get "privacy", :to => 'home#privacy'
  get "mb/:site_slug", :to => 'custom_sites#index', :as => 'custom_site_home'
  get "mb/:site_slug/about", :to => 'custom_sites#about', :as => 'custom_sites_about'
  get "mb/:site_slug/savings", :to => 'custom_sites#savings', :as => 'custom_sites_savings'
  get "mb/:site_slug/health", :to => 'custom_sites#health', :as => 'custom_sites_health'
  get "mb/:site_slug/insurance", :to => 'custom_sites#insurance', :as => 'custom_sites_insurance'
  get "mb/:site_slug/security", :to => 'custom_sites#security', :as => 'custom_sites_security'

  root :to => "home#index"
  get "about", to: 'home#about'

  # apipie
  namespace :api do
    namespace :v1 do
      resources :benefits do
        resources :sections
      end
      resources :site_configs
      devise_for :users, :controllers => { :sessions => "api/v1/sessions"}
    end
  end

end
