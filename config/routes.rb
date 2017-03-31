Rails.application.routes.draw do

  resources :users

  put 'users', to: 'users#create'
  post 'users/:id', to: 'users#update'
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show'
  delete 'users/:id', to: 'users#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

