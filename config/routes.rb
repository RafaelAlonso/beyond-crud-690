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
  end


  root to: 'restaurants#index'
end
