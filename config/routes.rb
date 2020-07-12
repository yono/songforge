Rails.application.routes.draw do
  root 'songs#index'
  resources :sessions, only: [:new, :create, :destroy]
  get    '/signin',  to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  resources :sing_logs, only: [:index, :destroy]

  resources :songs do
    member do
      get :singing
      get :pinning
      get :remove_pin
    end
  end

  resources :artists
end
