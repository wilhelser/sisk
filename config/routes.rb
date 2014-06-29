Sisk::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      resources :sites
      resources :benefits
      resources :sections
    end
  end

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
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

  devise_for :users, :token_authentication_key => 'authentication_key'

  get "home/index"
  get "usage", :to => 'home#usage'
  devise_for :users, :controllers => { :registrations => "registrations"}
  resources :users
  root :to => "home#index"
  get "about", to: 'home#about'

end
