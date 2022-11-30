Rails.application.routes.draw do

  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

  namespace :api do
    namespace :v1 do
      resources :user, only: [:new] do
        resources :category, only: [:index, :create]
      end
      resources :expense, only: [:index, :create]
    end    
  end

end
