Rails.application.routes.draw do
  root to: 'invests#index'

  # Clearance Routes

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  resources :passwords, controller: "passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :show] do
    resource :password,
             controller: "passwords",
             only: [:create, :edit, :update]
  end

  resources :invests do
    resources :statuses, only: [:new, :create]
  end

  namespace :settings do
    resource :account, controller: "accounts", only: [:edit, :update]
    resource :password, controller: "passwords", only: [:edit, :update]
    resource :profile, controller: "profiles", only: [:edit, :update]
  end

end
