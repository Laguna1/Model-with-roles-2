# frozen_string_literal: true

Rails.application.routes.draw do
  root 'vizits#index'
  devise_for :users
  # resources :users, only: %i[index show]
  scope '/admin' do
    resources :users
  end

  post '/users/:id/book', to: 'users#book', as: 'book_doctor'
  post '/users/:id/unbook', to: 'users#unbook', as: 'unbook_doctor'

  resources :contacts
  resources :vizits
  resources :roles
  resources :categories

end
