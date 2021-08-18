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
    # como precisamos saber sobre QUAL restarante o usuario esta criando uma review
    # (e como nao teremos um campo no formulario perguntando qual eh, vide exemplo
    # do comentario num post do Instagram), precisamos guardar o id do restaurante
    # na url.
    resources :reviews, only: [:new, :create]
  end

  # quando vamos destruir uma review, so o que precisamos eh saber o id dela mesma,
  # nao sendo necessario o id do restaurante a qual ela pertence. Por esse motivo,
  # o destroy fica do lado de FORA do resources de restaurants
  resources :reviews, only: [:destroy]

  root to: 'restaurants#index'
end
