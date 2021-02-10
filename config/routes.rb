Rails.application.routes.draw do
  # Devise Routes
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new", as: :new_user_session
    get "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end

  # RESTful Routes
  resources :gists

  # Catch-all Routes
  get "/:username", to: "users/gists#index", as: :user_gists

  # Root Routes
  authenticated { root to: "gists#new" }
  root to: "landing#show", as: :landing
end
