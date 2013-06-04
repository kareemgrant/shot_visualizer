ShotVisualizerApi::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/plays/:season/:player' => "plays#index"
    end
  end
end
