Rails.application.routes.draw do

  resources :users

  put 'usuario', to: 'users#create'
  post 'usuario/:id', to: 'users#update'
  get 'usuario', to: 'users#index'
  get 'usuario/:id', to: 'users#show'
  delete 'usuario/:id', to: 'users#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

