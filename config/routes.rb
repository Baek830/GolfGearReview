Rails.application.routes.draw do
  devise_for :users
  resources :gears do
    resources :reviews
  end
  root 'gears#index'
end
