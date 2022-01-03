Rails.application.routes.draw do
  

  devise_for :users
  root to: 'home#index'
  resources :categories
  resources :editorials
  resources :authors
  resources :countries
  resources :books
 
end
