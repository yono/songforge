SongForge::Application.routes.draw do
  resources :sing_logs, :only => [:index]

  resources :songs do
    member do
      get :singing
      get :lyrics_image
    end
  end

  resources :artists

  root :to => 'songs#index'
end
