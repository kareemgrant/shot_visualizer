ShotVisualizerApi::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :plays, only: :index
      resources :teams, only: :index
    end
  end
end
