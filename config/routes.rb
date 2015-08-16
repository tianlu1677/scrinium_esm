ScriniumEsm::Engine.routes.draw do
  resources :experiments
  resources :coupled_models
  resources :sea_ice_models
  resources :lnd_models
  resources :ocn_models
  resources :atm_models
end
