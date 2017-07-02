Rails.application.routes.draw do
  namespace :api do
    resources :trip
  end

  resources :users, only: [:new, :create, :show, :destroy]
  root 'users#new'

  resources :sessions


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
