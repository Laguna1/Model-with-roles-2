# frozen_string_literal: true

Rails.application.routes.draw do
  resources :appointments
  devise_for :users
  get '/welcome/index'
  root 'visits#index'
  resources :users, only: %i[index show update]

  scope '/admin' do
    resources :users
  end
  resources :roles
  resources :categories
  resources :visits
end
