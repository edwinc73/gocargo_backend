Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "users/profile", to: "users#profile"
  resources :cars, only: %i[show create index] do
    post "bookings", to: "bookings#create"
  end
  resources :bookings, only: %i[show update]
end
