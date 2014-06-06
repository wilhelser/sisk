Sisk::Application.routes.draw do
  resources :sites

  get "home/index"
  devise_for :users
  root :to => "home#index"
end
