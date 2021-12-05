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

  post '/users/:id/book', to: 'users#book', as: 'book_doctor'
  post '/users/:id/unbook', to: 'users#unbook', as: 'unbook_doctor'
  resources :vizits
  resources :roles
  resources :categories
  resources :contacts
end
