Rails.application.routes.draw do
  resources :users
  get 'login', to: 'users#find'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
