# TODO: 找到一种更为合适的方法解决CollectionsController加载问题。
ScriniumEsm::CollectionsController = CollectionsController
ScriniumEsm::CommentsController = CommentsController
ScriniumEsm::ResourcesController = ResourcesController

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
  concern :resourceable do
    resources :resources, concerns: [ :collectable, :commentable ]
  end
  resources :users do
    resources :experiments, except: :index, concerns: [ :collectable, :commentable ] do
      resources :diagnostic_results
    end
    get '/experiments/:id/add_log' => 'experiments#add_log', as: :add_experiment_log
    resources :metrics, except: :index, concerns: [ :resourceable, :collectable, :commentable ]
    get '/metrics/:id/add_resource' => 'metrics#add_resource', as: :add_metric_resource
    resources :comparison_projects, except: :index, concerns: [ :resourceable, :collectable, :commentable ] do
      resources :experiment_specs
    end
    resources :diagnostic_results, concerns: [ :resourceable, :collectable, :commentable ]
    resources :experiment_specs, concerns: [ :resourceable, :collectable, :commentable ]
  end
  get '/experiments' => 'experiments#index'
  get '/metrics' => 'metrics#index'
  get '/comparison_projects' => 'comparison_projects#index'
  resources :coupled_models
  resources :sea_ice_models
  resources :lnd_models
  resources :ocn_models
  resources :atm_models
  resources :data
end
