Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :episodes, only: %w[index show edit update new create]
  end

  resources :episodes, only: %i[show index], param: :slug

  root to: "welcome#index"

  get "about", to: "welcome#about", as: :about
  get "imprint", to: "welcome#imprint", as: :imprint
  get "privacy", to: "welcome#privacy", as: :privacy

  devise_scope :user do
    get "login", to: "devise/sessions#new"
  end
end
