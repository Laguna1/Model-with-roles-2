Rails.application.routes.draw do
  devise_for :users
  scope '/admin' do
    resources :users
  end
  root 'vizits#index'
  resources :vizits
  resources :roles
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
