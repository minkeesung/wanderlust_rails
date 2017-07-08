Rails.application.routes.draw do
  namespace :api do
    resources :trips
  end

  namespace :api do
    resources :sessions
  end


  namespace :api do
    resources :users
  end
  resources :users, only: [:new, :create, :show, :destroy]
  root 'users#new'

  resources :sessions


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
