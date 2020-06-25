Rails.application.routes.draw do
  resources :courses
  resources :users
  get 'login', to: 'users#find'
  patch 'updateFavorite/:id', to: 'users#updateFavorite'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
