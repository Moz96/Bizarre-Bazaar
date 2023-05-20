Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "pages#home"
  
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create, :show, :destroy] do
      resources :reviews, only: [:new, :create]
    end
  end

  # Define your other application routes here

end
