Sisk::Application.routes.draw do
  resources :benefits

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :sites do
    member do
      get "savings", to: 'sites#savings'
      get "about", to: 'sites#about'
      get "savings", to: 'sites#savings'
      get "health", to: 'sites#health'
      get "insurance", to: 'sites#insurance'
      get "security", to: 'sites#security'
      get "register", to: 'sites#register'
      get "login", to: 'sites#login'
    end
  end

  get "home/index"
  devise_for :users
  resources :users
  root :to => "home#index"
  get "about", to: 'home#about'

end
