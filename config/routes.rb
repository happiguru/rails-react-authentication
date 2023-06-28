Rails.application.routes.draw do
 resources :sessions, only: [:create]
 resources :registrations, only: [:create]
  root "static#home"
end
