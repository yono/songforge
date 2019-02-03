Rails.application.routes.draw do
  get '/sp', to: 'mobile#index', as: :mobile
  resources :sessions, only: [:new, :create, :destroy]
  get    '/signin',  to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  resources :sing_logs, only: [:index, :destroy]

  resources :songs do
    member do
      get :singing
      get :lyrics_image
      get :pinning
      get :remove_pin
    end
  end

  resources :artists

  root 'songs#index'

  namespace :api, defaults: { format: :json } do
    resources :songs, only: :index
  end
end
