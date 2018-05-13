Rails.application.routes.draw do
  # TODO: Update routes to use resources as much as possible
  get 'invests/new'
  post 'invests' => 'invests#create'
  get 'invests/update'
  resources :passwords, controller: "passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  root to: 'invests#index'
end
