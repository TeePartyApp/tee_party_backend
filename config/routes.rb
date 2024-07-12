Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # User Routes
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  delete "users/:id" => "users#destroy"

  # Sessions routes
  post "/sessions" => "sessions#create"

  # Match Routes
  get "/matches" => "matches#index"
  get "/matches/:id" => "matches#show"
  post "/matches" => "matches#create"
  patch "/matches/:id" => "matches#update"
  delete "/matches/:id" => "matches#destroy"
  resources :matches do
    member do
      patch :reject
    end
  end
end
