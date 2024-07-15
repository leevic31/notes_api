Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    post '/auth/signup', to: 'auth#signup'
    post '/auth/login', to: 'auth#login'

    resources :notes do
      member do
        post 'share', to: 'share_notes#create'
      end
    end

    resources :search_notes, only: [:index], path: 'search'
  end
end
