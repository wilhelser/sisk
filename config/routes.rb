Sisk::Application.routes.draw do
  resources :sections

  resources :benefits

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
      get "login", to: 'sites#login'
    end
  end

  get "home/index"
  get "usage", :to => 'home#usage'
  devise_for :users, :controllers => { :registrations => "registrations"}
  resources :users
  root :to => "home#index"
  get "about", to: 'home#about'

end
