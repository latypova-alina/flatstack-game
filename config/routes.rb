Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "pages#home"
end
