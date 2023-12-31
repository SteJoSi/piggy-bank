Rails.application.routes.draw do
  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  # get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

  resources :categories, only: [:index, :show, :create] do
    resources :expenses
  end

  resources :users, only: [:index, :show, :update] do
    resources :expenses, only: [:index, :update, :destroy]
  end

  post "/signup", to: "users#create" 
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
