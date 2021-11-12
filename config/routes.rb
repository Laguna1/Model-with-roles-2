Rails.application.routes.draw do
  resources :categories
  devise_for :users
  scope '/admin' do
    resources :users
  end
  root 'vizits#index'
  resources :vizits
  resources :roles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
