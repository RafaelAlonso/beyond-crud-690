Rails.application.routes.draw do
  resources :restaurants, except: [:index]
  root to: 'restaurants#index'
end
