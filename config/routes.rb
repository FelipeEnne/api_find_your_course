Rails.application.routes.draw do
  resources :courses
  resources :users
  post 'login', to: 'users#find'
end
