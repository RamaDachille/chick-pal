Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "mybookings", to: "pages#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :chickens, except: %i[edit update] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index show edit update]
end
