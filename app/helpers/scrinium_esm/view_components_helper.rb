module ScriniumEsm
  module ViewComponentsHelper
    def scrinium_esm_navbar_items
      {
        t('scrinium_esm.model') => {
          t('models.atm') => scrinium_esm.atm_models_path,
          t('models.ocn') => scrinium_esm.ocn_models_path,
          t('scrinium_esm.metric') => scrinium_esm.metrics_path
        },
        t('scrinium_esm.experiment') => scrinium_esm.experiments_path,
        t('scrinium_esm.data') => scrinium_esm.data_path
      }
    end
  end
end
