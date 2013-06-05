ShotVisualizerApi::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :plays, only: :index, as: 'player_shots'
      resources :teams, only: :index
    end
  end

  resources :charts, only: :index
end
