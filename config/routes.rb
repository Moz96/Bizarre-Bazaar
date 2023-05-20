Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create, :show, :destroy] do
      resources :reviews, only: [:new, :create]
    end
  end

  # Define your other application routes here

end
