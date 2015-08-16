module ScriniumEsm
  module ViewComponentsHelper
    def scrinium_esm_navbar_items
      {
        t('scrinium_esm.model') => {
          t('models.atm') => scrinium_esm.atm_models_path,
          t('models.ocn') => scrinium_esm.ocn_models_path
        },
        t('scrinium_esm.experiment') => {
          t('action.add')+t('scrinium_esm.experiment') => scrinium_esm.new_experiment_path
        }
      }
    end
  end
end
