Rails.application.routes.draw do
  devise_for :users
  resources :groceries
  root to: "groceries#new"
end
