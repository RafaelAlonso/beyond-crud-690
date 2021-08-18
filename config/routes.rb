Rails.application.routes.draw do
  resources :restaurants, except: [:index] do
    # - querer mostrar uma colecao especifica de restaurantes
    # - usamos quando nao estamos falando sobre um restaurante especifico
    collection do
      get :top
    end
    
    # - querer mostrar um detalhe diferente de um restaurante especifico
    # - usamos quando estamos falando sobre um restaurante especifico
    member do
      get :chef
    end
    
    # - querer rotas sobre um modelo relacionado a um restaurante especifico
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]
  
  root to: 'restaurants#index'
end
