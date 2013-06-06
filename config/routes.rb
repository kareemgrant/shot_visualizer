ShotVisualizerApi::Application.routes.draw do

  get 'shotcharts', :to => 'shot_charts#show', as: 'shotcharts'

  resources :teams, only: :index
  resources :rosters, only: :show
  resources :players, only: :show

  namespace :api do
    namespace :v1 do
      resources :plays, only: :index, as: 'player_shots'
      resources :teams, only: :index
    end
  end

  root :to => 'static_pages#index'

end
