Rails.application.routes.draw do
  devise_for :users
  root 'gears#index'
  resources :gears do
    resources :reviews
  end
  resources :users, only: :show
end
