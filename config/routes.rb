# frozen_string_literal: true

Rails.application.routes.draw do
  root 'vizits#index'
  devise_for :users
  resources :users, only: %i[show update] do
    resources :contacts, only: %i[create]
  end

  scope '/admin' do
    resources :users
  end
  resources :vizits
  resources :roles
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
