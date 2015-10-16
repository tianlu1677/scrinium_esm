# TODO: 找到一种更为合适的方法解决CollectionsController加载问题。
ScriniumEsm::CollectionsController = CollectionsController if not defined? ScriniumEsm::CollectionsController
ScriniumEsm::CommentsController = CommentsController if not defined? ScriniumEsm::CommentsController
ScriniumEsm::ResourcesController = ResourcesController if not defined? ScriniumEsm::ResourcesController

ScriniumEsm::Engine.routes.draw do
  # Concerns from main app -----------------------------------------------------
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
  # Experiment -----------------------------------------------------------------
  resources :experiments, concerns: [ :collectable, :commentable ]
  get '/experiments/:id/add_log' => 'experiments#add_log', as: :add_experiment_log
  # Diagnostic Result ----------------------------------------------------------
  resources :diagnostic_results, concerns: [ :resourceable, :collectable, :commentable ]
  # Metric ---------------------------------------------------------------------
  get '/metrics' => 'metrics#index'
  # Comparison Projects --------------------------------------------------------
  resources :comparison_projects, concerns: [ :resourceable, :collectable, :commentable ] do
    resources :experiment_specs
  end
  resources :experiment_specs, concerns: [ :resourceable, :collectable, :commentable ]
  # Metrics --------------------------------------------------------------------
  resources :metrics, except: :index, concerns: [ :resourceable, :collectable, :commentable ]
  # Models ---------------------------------------------------------------------
  get '/models', to: 'models#index'
  resources :coupled_models
  resources :sea_ice_models
  resources :lnd_models
  resources :ocn_models
  resources :atm_models
  # Data -----------------------------------------------------------------------
  resources :data
end
