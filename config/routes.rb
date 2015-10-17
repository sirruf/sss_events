Events::Engine.routes.draw do
  resources :events, only: [:index, :show]
  namespace :admin do
    resources :events do
    end
    resources :courses, path: '/events_courses'
    resources :categories, path: '/events_categories'
  end
end
