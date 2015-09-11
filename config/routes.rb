# TODO: 找到一种更为合适的方法解决CollectionsController加载问题。
ScriniumEsm::CollectionsController = CollectionsController
ScriniumEsm::CommentsController = CommentsController

ScriniumEsm::Engine.routes.draw do
  # NOTE: 需要和主应用中的concerns保持一致。
  concern :collectable do
    get '/collect', controller: 'collections', action: 'collect', as: :collect
    get '/uncollect', controller: 'collections', action: 'uncollect', as: :uncollect
  end
  concern :commentable do
    resources :comments, except: [ :new, :show ]
    get '/comments/reply/:id' => 'comments#reply', as: :reply_comment
  end
  resources :users do
    resources :experiments, except: :index, concerns: [ :collectable, :commentable ]
    get '/experiments/:id/add_log' => 'experiments#add_log', as: :add_experiment_log
  end
  get '/experiments' => 'experiments#index'
  resources :coupled_models
  resources :sea_ice_models
  resources :lnd_models
  resources :ocn_models
  resources :atm_models
end
