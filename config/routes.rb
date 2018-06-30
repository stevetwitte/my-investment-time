require 'sidekiq/web'

Rails.application.routes.draw do
  get 'activities/index'
  root to: 'invests#index'

  resources :invests do
    resources :statuses, only: [:new, :create]
    resources :likes, controller: "likes", only: [:create, :destroy]
  end

  namespace :settings do
    resource :account, controller: "accounts", only: [:edit, :update]
    resource :password, controller: "passwords", only: [:edit, :update]
    resource :profile, controller: "profiles", only: [:edit, :update]
  end

  resources :teams do
    resources :invites, controller: "activities/invites"
  end

  resource :activites, controller: "activities", only: [:index]

  resources :users, controller: "users", only: [:create, :show] do
    resource :password,
             controller: "passwords",
             only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  resources :passwords, controller: "passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  # Sidekiq Routes

  constraints Clearance::Constraints::SignedIn.new { |user| user.email == "stevetwitte@gmail.com" } do
    mount Sidekiq::Web, at: "/sidekiq"
  end
end
