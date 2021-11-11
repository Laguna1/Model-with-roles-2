Rails.application.routes.draw do
  devise_for :users
  root 'vizits#index'
  resources :vizits
  resources :users
  resources :roles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
