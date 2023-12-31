Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#login', as: :login
      get "users/profile", to: "users#profile"
      resources :cars, only: %i[show create index] do
        resources :bookings, only: :create
        post 'upload_img', to: "cars#upload_img"
      end
      resources :favourite_cars, only: %i[create update]
      resources :bookings, only: %i[index show update]
    end
  end
end
