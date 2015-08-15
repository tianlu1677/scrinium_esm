module ScriniumEsm
  module ViewComponentsHelper
    def scrinium_esm_navbar_items
      {
        t('models.model') => {
          t('models.atm') => scrinium_esm.atm_models_path,
          t('models.ocn') => scrinium_esm.ocn_models_path
        }
      }
    end
  end
end
