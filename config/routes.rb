# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :users, only: %i[index show update]

  scope '/admin' do
    resources :users
  end
  resources :roles
  resources :categories
end
