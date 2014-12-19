Rails.application.routes.draw do
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
