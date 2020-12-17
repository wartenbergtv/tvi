Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :episodes
  end

  resources :episodes, only: %i[show index]

  root to: "welcome#index"

  get "about", to: "welcome#about", as: :about
  get "imprint", to: "welcome#imprint", as: :imprint
  get "privacy", to: "welcome#privacy", as: :privacy
end
