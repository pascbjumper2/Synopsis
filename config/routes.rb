Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :notes

  mount Upmin::Engine => '/admin'
  root to: "notes#index"
  #root to: 'visitors#index'
  resources :visitors
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users
  resources :landing
  resources :design
end
