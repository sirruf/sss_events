Rails.application.routes.draw do

  mount Events::Engine => "/", as: 'events'
end
