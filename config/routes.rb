Rails.application.routes.draw do

  namespace :admin do
    resources :episodes
  end

  root to: "welcome#index"
end
