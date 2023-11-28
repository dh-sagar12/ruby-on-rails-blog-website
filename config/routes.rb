Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :contacts
  resources :articles
  resources :categories
  resources :users, except: [:new]
  # Defines the root path route ("/")
  root "pages#home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "about" => "pages#about", as: :about_page
  get "contact" => "pages#contact", as: :contact_us_page
  get "signup" => "users#signup", as: :user_sign_up

  # loging and sessions routes
  get "login" => "sessions#login", as: :user_login
  post "login" => "sessions#create", as: :user_session
  delete "logout" => "sessions#destroy", as: :user_logout
end
