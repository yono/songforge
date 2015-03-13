Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get    '/signin',  to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  resources :sing_logs, only: [:index, :destroy]

  resources :songs do
    member do
      get :singing
      get :lyrics_image
    end
  end

  resources :artists

  root 'songs#index'
end
