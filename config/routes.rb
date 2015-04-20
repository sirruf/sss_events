Events::Engine.routes.draw do
  resources :events, only: [:index, :show]
  namespace :admin do
    resources :events do
    end
  end
end
