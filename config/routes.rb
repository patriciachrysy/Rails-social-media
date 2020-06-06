Rails.application.routes.draw do
  resources :users, except: [:destroy]
  resources :sessions, only: [:new, :create]
  get '/sign-up', to: 'users#new'
  get '/sign-in', to: 'sessions#new'
  get '/sign-out', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
