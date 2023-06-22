Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'user_sessions#login', as: :login
      get "users/profile", to: "users#profile"
      resources :cars, only: %i[show create index] do
        member do
          post "bookings", to: "bookings#create"
        end
      end
      resources :bookings, only: %i[index show update]
    end
  end
end
