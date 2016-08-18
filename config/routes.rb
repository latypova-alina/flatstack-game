Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "games#index"
  resources :games
end
