Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'user/new', to:"users#new"
  post 'user/new', to:"users#create"
  get 'users', to:'users#index'
  root 'users#index'
end
