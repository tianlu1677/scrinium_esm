# TODO: 找到一种更为合适的方法解决CollectionsController加载问题。
ScriniumEsm::CollectionsController = CollectionsController

ScriniumEsm::Engine.routes.draw do
  concern :collectable do
    get '/collect', controller: 'collections', action: 'collect', as: :collect
    get '/uncollect', controller: 'collections', action: 'uncollect', as: :uncollect
  end
  resources :users do
    resources :experiments, except: :index, concerns: [ :collectable ]
  end
  get '/experiments' => 'experiments#index'
  resources :coupled_models
  resources :sea_ice_models
  resources :lnd_models
  resources :ocn_models
  resources :atm_models
end
