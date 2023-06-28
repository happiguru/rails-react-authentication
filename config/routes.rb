Rails.application.routes.draw do
 
 namespace 'authentication' do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
 end
  root "static#home"
end
